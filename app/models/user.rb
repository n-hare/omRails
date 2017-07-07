class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise  :database_authenticatable, :registerable,
            :rememberable, :trackable, :validatable
    has_many :questions
    has_many :answers

    validates :username, presence: true, uniqueness: true

    acts_as_voter
end
