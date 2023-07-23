class CreateImagenPerfils < ActiveRecord::Migration[7.0]
  def change
    create_table :imagen_perfils do |t|
      t.references :imageable, polymorphic: true, null: false
      t.string :url

      t.timestamps
    end
  end
end
