class PagamentosController < ApplicationController
  before_action :set_pagamento, only: %i[ show edit update destroy ]

  # GET /pagamentos or /pagamentos.json
  def index
    @pagamentos = Pagamento.all
  end

  # GET /pagamentos/1 or /pagamentos/1.json
  def show
  end

  # GET /pagamentos/new
  def new
    @pagamento = Pagamento.new
  end

  # GET /pagamentos/1/edit
  def edit
  end

  # POST /pagamentos or /pagamentos.json
  def create
    @pagamento = Pagamento.new(pagamento_params)

    respond_to do |format|
      if @pagamento.save
        format.html { redirect_to pagamento_url(@pagamento), notice: "Pagamento was successfully created." }
        format.json { render :show, status: :created, location: @pagamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagamentos/1 or /pagamentos/1.json
  def update
    respond_to do |format|
      if @pagamento.update(pagamento_params)
        format.html { redirect_to pagamento_url(@pagamento), notice: "Pagamento was successfully updated." }
        format.json { render :show, status: :ok, location: @pagamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagamentos/1 or /pagamentos/1.json
  def destroy
    @pagamento.destroy

    respond_to do |format|
      format.html { redirect_to pagamentos_url, notice: "Pagamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagamento
      @pagamento = Pagamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pagamento_params
      params.require(:pagamento).permit(:comanda_id, :metodo_pagamento, :valor_total_pago, :troco, :data, :hora)
    end
end