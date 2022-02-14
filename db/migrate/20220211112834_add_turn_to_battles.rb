class AddTurnToBattles < ActiveRecord::Migration[7.0]
  def change
    add_column :battles, :turn, :integer
  end
end
