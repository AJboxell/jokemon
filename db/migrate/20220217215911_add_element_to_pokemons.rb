class AddElementToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :element, :string
  end
end
