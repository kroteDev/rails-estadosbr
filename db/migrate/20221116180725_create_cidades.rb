class CreateCidades < ActiveRecord::Migration[6.1]
  def change
    create_table :cidades do |t|
      t.references :estado, null: false, foreign_key: true
      t.string :nome

      t.timestamps
    end
  end
end
