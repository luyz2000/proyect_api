class CreateActivityLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_logs do |t|
      t.references :baby, null: false, foreign_key: true, index: true
      t.references :assistant, null: false, foreign_key: true, index: true
      t.references :activity, null: false, foreign_key: true, index: true
      t.datetime :start_time
      t.datetime :stop_time
      t.datetime :duration
      t.string :name
      t.text :comments

      t.timestamps
    end
  end
end
