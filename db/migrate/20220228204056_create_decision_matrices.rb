class CreateDecisionMatrices < ActiveRecord::Migration[7.0]
  def change
    create_table :decision_matrices do |t|

      t.timestamps
    end
  end
end
