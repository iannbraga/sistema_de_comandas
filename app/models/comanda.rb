class Comanda < ApplicationRecord
  has_many :pedidos
  has_many :pagamentos
end
