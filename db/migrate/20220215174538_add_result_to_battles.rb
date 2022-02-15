class AddResultToBattles < ActiveRecord::Migration[7.0]
  def change
    add_column :battles, :result, :string
  end
end
