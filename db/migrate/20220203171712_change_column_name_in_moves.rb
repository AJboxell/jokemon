class ChangeColumnNameInMoves < ActiveRecord::Migration[7.0]
  def change
    rename_column :moves, :type, :element
  end
end
