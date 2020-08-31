class Player < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.boolean :attacked
      t.bigint :countdown

      t.timestamps
    end
  end
end
