class Disease < ApplicationRecord
  belongs_to :patient

  with_options presence: true do
    validates :disease_name
    validates :date_of_onset
    validates :status_id
  end
end
