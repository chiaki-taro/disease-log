class CreateDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :diseases do |t|
      t.references  :patient,           null: false, foreign_key: true
      t.string      :disease_name,      null: false
      t.datetime    :date_of_onset,     null: false
      t.integer     :status_id,         null: false
      t.timestamps
    end
  end
end
