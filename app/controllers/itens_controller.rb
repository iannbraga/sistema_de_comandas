class ItensController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /itens or /itens.json
  def index
    @itens = Item.all
  end

  # GET /itens/1 or /itens/1.json
  def show
  end

  # GET /itens/new
  def new
    @item = Item.new
  end

  # GET /itens/1/edit
  def edit
  end

  # POST /itens or /itens.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itens/1 or /itens/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itens/1 or /itens/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to itens_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:pedido_id, :produto_id, :quantidade, :preco_unitario, :subtotal, :observacoes, produtos_attributes: [:id, :nome, :descricao, :preco, :estoque, :categoria, :_allow_destroy])
    end
end
