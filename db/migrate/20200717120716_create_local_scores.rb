class CreateLocalScores < ActiveRecord::Migration[6.0]
  def change
    create_table :local_scores do |t|
      t.string :username
      t.integer :wins
      t.integer :draws
      t.integer :losses

      t.timestamps
    end
  end
end
