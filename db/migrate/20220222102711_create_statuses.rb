class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.boolean :cumulative
      t.string :message

      t.timestamps
    end
  end
end
