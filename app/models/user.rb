class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one  :phonenumber,dependent: :destroy
  has_one :address,dependent: :destroy
  has_one :profile
  has_many :cards
  has_many :items
  # has_many :comments

  accepts_nested_attributes_for :address

end
