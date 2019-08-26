class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: [ :'男性', :'女性' ]
  enum age: [ :'10代', :'20代', :'30代', :'40代', :'50代', :'60代以上' ]

  has_many :memorys, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  attachment :profile_image
end
