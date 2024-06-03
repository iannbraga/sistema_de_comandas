class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy pagar ]

  def index
    @pedidos = Pedido.all
  end

  def show
  end

  # def new
  #   @pedido = Pedido.new
  #   @pedido.itens.build
  #   @comanda = Comanda.find(numero: params[:numero_comanda]) unless params[:numero_comanda].nil?
  #   @pedido.comanda = @comanda
  #   @pedido.data = Date.today
  #   @pedido.hora = Time.now
  # end

  def edit
  end

  # def create
  #   @pedido = Pedido.new(pedido_params)
  #   @pedido.data = Date.today
  #   @pedido.hora = Time.now

  #   @comanda = Comanda.find(numero: params[:numero_comanda]) unless params[:numero_comanda].nil?

  #   respond_to do |format|
  #     if @pedido.save
  #       @pedido.comanda.atualizar_total
  #       @pedido.comanda.atualizar_status
  #       format.html { redirect_to comanda_path(@pedido.comanda), notice: "Pedido was successfully created." }
  #       format.json { render :show, status: :created, location: @pedido }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @pedido.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def new
    @pedido = Pedido.new
    @pedido.itens.build
    @pedido.data = Date.today
    @pedido.hora = Time.now
  end

  def edit
  end

  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.data = Date.today
    @pedido.hora = Time.now

    # Buscar comanda pelo número informado
    comanda_numero = params[:pedido][:numero_comanda]
    @comanda = Comanda.find_by(numero: comanda_numero)

    if @comanda
      @pedido.comanda = @comanda
    else
      @pedido.errors.add(:comanda, "não encontrada")
    end

    respond_to do |format|
      if @pedido.errors.empty? && @pedido.save
        @pedido.comanda.atualizar_total
        @pedido.comanda.atualizar_status
        format.html { redirect_to comanda_path(@pedido.comanda), notice: "Pedido foi criado com sucesso." }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        @pedido.comanda.atualizar_total
        @pedido.comanda.atualizar_status
        format.html { redirect_to comanda_path(@pedido.comanda), notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    comanda = @pedido.comanda
    @pedido.destroy
    comanda.atualizar_total
    comanda.atualizar_status

    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def pagar
    @pedido.update(finalizado: true)
    @pedido.comanda.atualizar_total
    @pedido.comanda.atualizar_status
    redirect_to comanda_path(@pedido.comanda), notice: "Pedido foi marcado como finalizado."
  end

  private

  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  def pedido_params
    params.require(:pedido).permit(:comanda_id, :data, :hora, :observacoes, :total, :finalizado, itens_attributes: [:id, :produto_id, :preco_unitario, :quantidade, :subtotal, :observacoes, :_destroy])
  end
end
