# comandas_controller.rb
class ComandasController < ApplicationController
  before_action :set_comanda, only: %i[ show edit update destroy ]

  def index
    @q = Comanda.ransack(params[:q])
    @comandas = @q.result
  end

  def show
    @itens_por_produto = @comanda.pedidos.where(finalizado: false).includes(itens: :produto).flat_map(&:itens).group_by(&:produto)
    @itens_por_produto_json = @comanda.pedidos.where(finalizado: false).includes(itens: :produto).flat_map(&:itens).group_by(&:produto).map do |produto, itens|
      {
        nome_produto: produto.nome,
        quantidade_total: itens.sum(&:quantidade),
        preco_total: itens.sum { |item| item.quantidade * item.preco_unitario },
      }
    end.to_json
  end

  def new
    @comanda = Comanda.new
  end

  def edit
  end

  def create
    @comanda = Comanda.create(comanda_params)

    respond_to do |format|
      if @comanda.save
        format.html { redirect_to comanda_url(@comanda), notice: "Comanda was successfully created." }
        format.json { render :show, status: :created, location: @comanda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comanda.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comanda.update(comanda_params)
        format.html { redirect_to comanda_url(@comanda), notice: "Comanda was successfully updated." }
        format.json { render :show, status: :ok, location: @comanda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comanda.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comanda.destroy

    respond_to do |format|
      format.html { redirect_to comandas_url, notice: "Comanda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_comanda
    @comanda = Comanda.find(params[:id])
  end

  def comanda_params
    params.require(:comanda).permit(:numero, :nome, :status, :total, pagamento_attributes: [:id, :comanda_id, :metodo_pagamento, :valor_total_pago, :troco, :data, :hora, :_destroy])
  end
end
