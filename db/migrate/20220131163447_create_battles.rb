class CreateBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :battles do |t|
      t.references :user, references: :pokemons, foreign_key: { to_table: :pokemons}
      t.references :adversary, references: :pokemons, foreign_key: { to_table: :pokemons}
      t.timestamps
    end
  end
end
