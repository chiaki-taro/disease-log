class Patient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :user
  has_many :diseases, dependent: :destroy

  validates :sex_id, numericality: { other_than: 0, message: "can't be blank"} 

  with_options presence: true do
    validates :patient_name
    validates :sex_id
    validates :birthday
  end
end
