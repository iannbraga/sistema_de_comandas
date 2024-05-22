# comandas_controller.rb
class ComandasController < ApplicationController
  before_action :set_comanda, only: %i[ show edit update destroy ]

  def index
    @q = Comanda.ransack(params[:q])
    @comandas = @q.result(distinct: true).order(:numero)
  end

  def show
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
    params.require(:comanda).permit(:numero, :nome, :status, :total)
  end
end
