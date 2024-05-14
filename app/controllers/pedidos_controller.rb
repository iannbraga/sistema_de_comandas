class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]

  # GET /pedidos or /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
    @itens_agrupados = {}

    # Para cada item no pedido, agrupa os itens pelo ID do produto
    @pedido.itens.each do |item|
      @itens_agrupados[item.produto_id] ||= []
      @itens_agrupados[item.produto_id] << item
    end
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @pedido.itens.build
    @comanda = Comanda.find(params[:comanda_id]) unless params[:comanda_id].nil?
    @pedido.comanda = @comanda
    @pedido.data = Date.today
    @pedido.hora = Time.now
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos or /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    @pedido.data = Date.today
    @pedido.hora = Time.now
    
    respond_to do |format|
      if @pedido.save
        @pedido.comanda.atualizar_total

        format.html { redirect_to comanda_path(@pedido.comanda), notice: "Pedido was successfully created." }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to comanda_path(@pedido.comanda), notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pedido_params
    params.require(:pedido).permit(:comanda_id, :data, :hora, :observacoes, :total, itens_attributes: [:id, :produto_id, :preco_unitario, :quantidade, :subtotal, :observacoes, :_destroy])
  end
end
