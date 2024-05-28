class Disease < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :patient
  has_many :symptoms, dependent: :destroy

  validates :status_id, numericality: { other_than: 0, message: "can't be blank"} 

  with_options presence: true do
    validates :disease_name
    validates :date_of_onset
    validates :status_id
  end

  def last_symptom_time
    last_symptom = symptoms.last
    last_symptom ? last_symptom.time : nil
  end

  attribute :last_symptom_time
end
