class AddReferencesToDecisionMatrices < ActiveRecord::Migration[7.0]
  def change
    add_reference :decision_matrices, :pokemon, foreign_key: true
  end
end
