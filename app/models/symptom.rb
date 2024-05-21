class Symptom < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :level
  belongs_to :disease

  validates :level_id, numericality: { other_than: 0, message: "can't be blank"} 

  with_options presence: true do
    validates :symptoms
    validates :time
    validates :level_id
  end
end
