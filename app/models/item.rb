class Item < ApplicationRecord
  belongs_to :pedido, optional: true
  belongs_to :produto, optional: true
end
