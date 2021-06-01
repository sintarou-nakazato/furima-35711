class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name,       format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/ }
    validates :first_name,        format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/ }
    validates :family_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana,   format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end

  has_many :items
end
