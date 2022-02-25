class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :hp
      t.integer :attack
      t.string :status, array: true, default: []
      t.timestamps
    end
  end
end
