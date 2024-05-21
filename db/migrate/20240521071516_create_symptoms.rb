class CreateSymptoms < ActiveRecord::Migration[7.0]
  def change
    create_table :symptoms do |t|
      t.references  :disease,           null: false, foreign_key: true
      t.string      :symptoms,          null: false
      t.datetime    :time,              null: false
      t.integer     :level_id,          null: false
      t.text        :treatment
      t.text        :evaluation
      t.text        :memo
      t.timestamps
    end
  end
end
