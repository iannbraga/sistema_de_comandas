class ComandasController < ApplicationController
  before_action :set_comanda, only: %i[ show edit update destroy ]

  def index
    @q = Comanda.ransack(params[:q])
    @comandas = @q.result(distinct: true)
  end

  def show
  end

  def new
    @comanda = Comanda.new
  end

  def edit
  end

  def create
    comanda_service = ComandaService.new(comanda_params)
    @comanda = comanda_service.create_comanda

    respond_to do |format|
      if @comanda
        format.html { redirect_to comanda_url(@comanda), notice: "Comanda was successfully created." }
        format.json { render :show, status: :created, location: @comanda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comanda.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    comanda_service = ComandaService.new(comanda_params)

    respond_to do |format|
      if comanda_service.update_comanda(@comanda, comanda_params)
        format.html { redirect_to comanda_url(@comanda), notice: "Comanda was successfully updated." }
        format.json { render :show, status: :ok, location: @comanda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comanda.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    comanda_service = ComandaService.new(nil)
    comanda_service.destroy_comanda(@comanda)

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
