class AddColumnToBattles < ActiveRecord::Migration[7.0]
  def change
    add_column :battles, :message, :text
  end
end
