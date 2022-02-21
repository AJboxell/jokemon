class AddColumnsToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :sp_attack, :integer
  end
end
