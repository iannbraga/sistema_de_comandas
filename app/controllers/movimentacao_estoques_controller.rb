class MovimentacaoEstoquesController < ApplicationController
  before_action :set_movimentacao_estoque, only: %i[ show edit update destroy ]

  # GET /movimentacao_estoques or /movimentacao_estoques.json
  def index
    @movimentacao_estoques = MovimentacaoEstoque.all
  end

  # GET /movimentacao_estoques/1 or /movimentacao_estoques/1.json
  def show
  end

  # GET /movimentacao_estoques/new
  def new
    @movimentacao_estoque = MovimentacaoEstoque.new
    @movimentacao_estoque.data = Date.today
    @movimentacao_estoque.hora = Time.now
  end

  # GET /movimentacao_estoques/1/edit
  def edit
  end

  # POST /movimentacao_estoques or /movimentacao_estoques.json
  def create
    @movimentacao_estoque = MovimentacaoEstoque.new(movimentacao_estoque_params)

    respond_to do |format|
      if @movimentacao_estoque.save
        format.html { redirect_to movimentacao_estoque_url(@movimentacao_estoque), notice: "Movimentacao estoque was successfully created." }
        format.json { render :show, status: :created, location: @movimentacao_estoque }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movimentacao_estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimentacao_estoques/1 or /movimentacao_estoques/1.json
  def update
    respond_to do |format|
      if @movimentacao_estoque.update(movimentacao_estoque_params)
        format.html { redirect_to movimentacao_estoque_url(@movimentacao_estoque), notice: "Movimentacao estoque was successfully updated." }
        format.json { render :show, status: :ok, location: @movimentacao_estoque }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movimentacao_estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimentacao_estoques/1 or /movimentacao_estoques/1.json
  def destroy
    @movimentacao_estoque.destroy

    respond_to do |format|
      format.html { redirect_to movimentacao_estoques_url, notice: "Movimentacao estoque was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movimentacao_estoque
    @movimentacao_estoque = MovimentacaoEstoque.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movimentacao_estoque_params
    params.require(:movimentacao_estoque).permit(:produto_id, :quantidade, :motivo, :observacao, :data, :hora)
  end
end
