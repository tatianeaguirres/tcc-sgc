class Cliente < ApplicationRecord
  belongs_to :endereco
  accepts_nested_attributes_for :endereco
end
