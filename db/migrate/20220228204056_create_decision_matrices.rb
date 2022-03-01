class CreateDecisionMatrices < ActiveRecord::Migration[7.0]
  def change
    create_table :decision_matrices do |t|
      t.string :one
      t.string :two
      t.string :three
      t.string :four
      t.timestamps
    end
  end
end
