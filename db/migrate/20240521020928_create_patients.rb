class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.references  :user,           null: false, foreign_key: true
      t.string      :patient_name,   null: false
      t.integer     :sex_id,         null: false
      t.date        :birthday,       null: false
      t.timestamps
    end
  end
end
