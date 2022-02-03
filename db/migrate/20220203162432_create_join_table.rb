class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :pokemons, :moves
  end
end
