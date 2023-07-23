class CreateOferta < ActiveRecord::Migration[7.0]
  def change
    create_table :oferta do |t|
      t.string :titulo
      t.text :descripcion
      t.string :salario
      t.string :horas
      t.string :ciudad
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
