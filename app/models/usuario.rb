class Usuario < ApplicationRecord
  validates_presence_of :usuario, :nombre
end
