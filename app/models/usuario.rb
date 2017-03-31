class Usuario < ApplicationRecord
  validates_presence_of :usuario, :nombre

  def self.with_count
    { usuarios: Usuario.all, total: Usuario.all.count}
  end

end
