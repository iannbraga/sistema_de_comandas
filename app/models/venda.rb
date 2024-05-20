class Venda < ApplicationRecord
  has_many :itens, dependent: :destroy

  accepts_nested_attributes_for :itens, allow_destroy: true
end
