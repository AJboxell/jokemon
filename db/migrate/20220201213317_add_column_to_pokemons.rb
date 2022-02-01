class AddColumnToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :max_hp, :integer
  end
end
