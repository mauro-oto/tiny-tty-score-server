class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :name
      t.bigint :score

      t.timestamps
    end
  end
end
