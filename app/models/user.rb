class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :birthday, presence: true

         with_options presence: true, format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]+\z/ } do
         validates :password, presence: true
        end
 with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do     
         validates :first_name, presence: true
         validates :family_name, presence: true
 end
 with_options presence: true, format: { with:/\A[ァ-ヴー]+\z/u } do
         validates :first_name_kana, presence: true
         validates :family_name_kana, presence: true
 end
end
