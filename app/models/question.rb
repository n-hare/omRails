class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :user, presence: true
  validates :content, presence: true
end
