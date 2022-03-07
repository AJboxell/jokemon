class CreateMovesDecisionMatricesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :moves, :decision_matrices do |t|
      # t.index [:move_id, :decision_matrix_id]
      # t.index [:decision_matrix_id, :move_id]
    end
  end
end
