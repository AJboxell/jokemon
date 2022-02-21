class AddSpecialToMoves < ActiveRecord::Migration[7.0]
  def change
    add_column :moves, :special, :string
  end
end
