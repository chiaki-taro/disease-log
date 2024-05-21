class Patient < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :patient_name
    validates :sex_id
    validates :birthday
  end
end
