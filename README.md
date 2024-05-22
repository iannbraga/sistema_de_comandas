# README

1. Comanda:
   - Número (identificador único da comanda)
   - Total (valor total dos pedidos na comanda)
   - Lista de Pedidos (para armazenar os pedidos feitos nessa comanda)
rails g scaffold Comanda numero:integer total:decimal 

class Comanda < ApplicationRecord
  has_many :pedidos
  has_many :pagamentos
end


2. Pedido:
   - Número (identificador único do pedido)
   - Comanda (referência à comanda associada ao pedido)
   - Data e hora do pedido
   - Lista de Itens
   - Status (em andamento, concluído, cancelado, etc.)
   - Observações (por exemplo, preferências do cliente)
rails g scaffold Pedido comanda:references data:date hora:time observacoes

class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens
end


3. Item:
   - Produto (referência ao produto associado ao item)
   - Quantidade
   - Preço unitário
   - Subtotal
   - Observações (por exemplo, ingredientes extras)
rails g scaffold Item pedido:references produto:references quantidade:integer preco_unitario:decimal subtotal:decimal observacoes

class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
end


4. Produto:
   - Nome
   - Descrição
   - Preço
   - Estoque
   - Categoria (por exemplo, bebidas, petiscos, pratos principais)

rails g scaffold Produto nome:string descricao:text preco:decimal estoque:integer categoria

class Produto < ApplicationRecord
  has_many :itens
end


5. Pagamento:
   - Comanda (referência à comanda associada ao pagamento)
   - Método de pagamento (dinheiro, cartão, etc.)
   - Valor total pago
   - Troco (apenas para pagamento em dinheiro)
   - Data e hora do pagamento
rails g scaffold Pagamento comanda:references metodo_pagamento:string valor_total_pago:decimal troco:decimal data:date hora:time

class Pagamento < ApplicationRecord
  belongs_to :comanda
end


### Estrutura do Banco de Dados e Modelos

#### Modelo `Comanda`

```ruby
class Comanda < ApplicationRecord
  has_many :pedidos
  has_many :pagamentos

  validates :numero, presence: true, uniqueness: true

  def atualizar_total
    self.total = pedidos.sum(:total)
    save
  end
end
```

#### Migração para `Comanda`

```ruby
rails g scaffold Comanda numero:integer total:decimal
```

#### Modelo `Pedido`

```ruby
class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens

  validates :comanda_id, presence: true
  validates :data, :hora, presence: true
  validate :comanda_nao_fechada

  before_save :calcular_total
  after_save :atualizar_total_comanda

  def calcular_total
    self.total = itens.sum(:subtotal)
  end

  private

  def comanda_nao_fechada
    if comanda.status == 'Fechada'
      errors.add(:comanda, "não pode adicionar pedidos a uma comanda fechada")
    end
  end

  def atualizar_total_comanda
    comanda.atualizar_total
  end
end
```

#### Migração para `Pedido`

```ruby
rails g scaffold Pedido comanda:references data:date hora:time observacoes:string
```

#### Modelo `Item`

```ruby
class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  validates :produto_id, :quantidade, :preco_unitario, presence: true
  validate :estoque_suficiente

  before_save :calcular_subtotal
  after_save :atualizar_estoque

  def calcular_subtotal
    self.subtotal = quantidade * preco_unitario
  end

  private

  def estoque_suficiente
    if produto.estoque < quantidade
      errors.add(:quantidade, "não pode ser maior que o estoque disponível")
    end
  end

  def atualizar_estoque
    produto.update(estoque: produto.estoque - quantidade)
  end
end
```

#### Migração para `Item`

```ruby
rails g scaffold Item pedido:references produto:references quantidade:integer preco_unitario:decimal subtotal:decimal observacoes:string
```

#### Modelo `Produto`

```ruby
class Produto < ApplicationRecord
  has_many :itens

  validates :nome, :preco, :estoque, :categoria, presence: true
end
```

#### Migração para `Produto`

```ruby
rails g scaffold Produto nome:string descricao:text preco:decimal estoque:integer categoria:string
```

#### Modelo `Pagamento`

```ruby
class Pagamento < ApplicationRecord
  belongs_to :comanda

  validates :comanda_id, :metodo_pagamento, :valor_total_pago, :data, :hora, presence: true
  validates :troco, numericality: { greater_than_or_equal_to: 0 }, if: :dinheiro?

  private

  def dinheiro?
    metodo_pagamento == 'dinheiro'
  end
end
```

#### Migração para `Pagamento`

```ruby
rails g scaffold Pagamento comanda:references metodo_pagamento:string valor_total_pago:decimal troco:decimal data:date hora:time
```

### Validações e Callbacks

Para garantir que todas as regras de negócio sejam seguidas, você pode adicionar as seguintes validações e callbacks:

- **Comanda**: Deve calcular e atualizar seu total sempre que um pedido associado for salvo.
- **Pedido**: Deve calcular e atualizar seu total com base nos itens associados.
- **Item**: Deve calcular seu subtotal antes de salvar e verificar o estoque do produto.
- **Pagamento**: Deve garantir que troco seja válido somente para pagamentos em dinheiro.




##### Serviço `ComandaService`
  
  ```ruby
  # app/services/comanda_service.rb
  class ComandaService
    def initialize(comanda_params)
      @comanda_params = comanda_params
    end
  
    def create
      Comanda.create(@comanda_params)
    end
  
    def update(comanda, update_params)
      comanda.update(update_params)
    end
  
    def destroy(comanda)
      comanda.destroy
    end
  
    def calcular_total(comanda)
      total = comanda.pedidos.sum(:total)
      comanda.update(total: total)
    end
  end
  ```
  
  #### Serviço `PedidoService`
  
  ```ruby
  # app/services/pedido_service.rb
  class PedidoService
    def initialize(pedido_params)
      @pedido_params = pedido_params
    end
  
    def create
      pedido = Pedido.new(@pedido_params)
      if pedido.save
        ComandaService.new({}).calcular_total(pedido.comanda)
        pedido
      else
        nil
      end
    end
  
    def update(pedido, update_params)
      if pedido.update(update_params)
        ComandaService.new({}).calcular_total(pedido.comanda)
        pedido
      else
        nil
      end
    end
  
    def destroy(pedido)
      comanda = pedido.comanda
      pedido.destroy
      ComandaService.new({}).calcular_total(comanda)
    end
  end
  ```
  
  #### Serviço `ItemService`
  
  ```ruby
  # app/services/item_service.rb
  class ItemService
    def initialize(item_params)
      @item_params = item_params
    end
  
    def create
      item = Item.new(@item_params)
      if item.save
        item.pedido.update(total: item.pedido.itens.sum(:subtotal))
        ComandaService.new({}).calcular_total(item.pedido.comanda)
        item
      else
        nil
      end
    end
  
    def update(item, update_params)
      if item.update(update_params)
        item.pedido.update(total: item.pedido.itens.sum(:subtotal))
        ComandaService.new({}).calcular_total(item.pedido.comanda)
        item
      else
        nil
      end
    end
  
    def destroy(item)
      pedido = item.pedido
      item.destroy
      pedido.update(total: pedido.itens.sum(:subtotal))
      ComandaService.new({}).calcular_total(pedido.comanda)
    end
  end
  ```
  
  #### Serviço `ProdutoService`
  
  ```ruby
  # app/services/produto_service.rb
  class ProdutoService
    def initialize(produto_params)
      @produto_params = produto_params
    end
  
    def create
      Produto.create(@produto_params)
    end
  
    def update(produto, update_params)
      produto.update(update_params)
    end
  
    def destroy(produto)
      produto.destroy
    end
  end
  ```
  
  #### Serviço `PagamentoService`
  
  ```ruby
  # app/services/pagamento_service.rb
  class PagamentoService
    def initialize(pagamento_params)
      @pagamento_params = pagamento_params
    end
  
    def create
      Pagamento.create(@pagamento_params)
    end
  
    def update(pagamento, update_params)
      pagamento.update(update_params)
    end
  
    def destroy(pagamento)
      pagamento.destroy
    end
  end
  ```
  
  #### Controlador `ComandasController`
  
  ```ruby
  class ComandasController < ApplicationController
    before_action :set_comanda, only: [:show, :edit, :update, :destroy]
  
    def index
      @comandas = Comanda.all
    end
  
    def show
    end
  
    def new
      @comanda = Comanda.new
    end
  
    def edit
    end
  
    def create
      service = ComandaService.new(comanda_params)
      @comanda = service.create
  
      if @comanda
        redirect_to @comanda, notice: 'Comanda criada com sucesso.'
      else
        render :new
      end
    end
  
    def update
      service = ComandaService.new(comanda_params)
      if service.update(@comanda, comanda_params)
        redirect_to @comanda, notice: 'Comanda atualizada com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      service = ComandaService.new({})
      service.destroy(@comanda)
      redirect_to comandas_url, notice: 'Comanda removida com sucesso.'
    end
  
    private
  
    def set_comanda
      @comanda = Comanda.find(params[:id])
    end
  
    def comanda_params
      params.require(:comanda).permit(:numero, :total)
    end
  end
  ```
  
  #### Controlador `PedidosController`
  
  ```ruby
  class PedidosController < ApplicationController
    before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  
    def index
      @pedidos = Pedido.all
    end
  
    def show
    end
  
    def new
      @pedido = Pedido.new
    end
  
    def edit
    end
  
    def create
      service = PedidoService.new(pedido_params)
      @pedido = service.create
  
      if @pedido
        redirect_to @pedido, notice: 'Pedido criado com sucesso.'
      else
        render :new
      end
    end
  
    def update
      service = PedidoService.new(pedido_params)
      if service.update(@pedido, pedido_params)
        redirect_to @pedido, notice: 'Pedido atualizado com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      service = PedidoService.new({})
      service.destroy(@pedido)
      redirect_to pedidos_url, notice: 'Pedido removido com sucesso.'
    end
  
    private
  
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end
  
    def pedido_params
      params.require(:pedido).permit(:comanda_id, :data, :hora, :observacoes)
    end
  end
  ```
  
  #### Controlador `ItensController`
  
  ```ruby
  class ItensController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
  
    def index
      @itens = Item.all
    end
  
    def show
    end
  
    def new
      @item = Item.new
    end
  
    def edit
    end
  
    def create
      service = ItemService.new(item_params)
      @item = service.create
  
      if @item
        redirect_to @item, notice: 'Item criado com sucesso.'
      else
        render :new
      end
    end
  
    def update
      service = ItemService.new(item_params)
      if service.update(@item, item_params)
        redirect_to @item, notice: 'Item atualizado com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      service = ItemService.new({})
      service.destroy(@item)
      redirect_to itens_url, notice: 'Item removido com sucesso.'
    end
  
    private
  
    def set_item
      @item = Item.find(params[:id])
    end
  
    def item_params
      params.require(:item).permit(:pedido_id, :produto_id, :quantidade, :preco_unitario, :subtotal, :observacoes)
    end
  end
  ```
  