class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :usuario
      t.string :twitter
    end
  end
end
