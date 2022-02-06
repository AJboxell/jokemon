class AddEvasionToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :evasion, :integer
  end
end
