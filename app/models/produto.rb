class Produto < ApplicationRecord
    has_many :itens, dependent: :destroy
end
