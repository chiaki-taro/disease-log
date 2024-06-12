class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :patients, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name,           presence: true
  validates :password,            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
