class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :ruby_last_name, :ruby_first_name, :dob, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :ruby_last_name, :ruby_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
end
