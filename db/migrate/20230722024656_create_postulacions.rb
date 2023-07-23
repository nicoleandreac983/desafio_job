class CreatePostulacions < ActiveRecord::Migration[7.0]
  def change
    create_table :postulacions do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :oferta, null: false, foreign_key: true
      t.text :mensaje

      t.timestamps
    end
  end
end
