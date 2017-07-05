class Answer < ApplicationRecord
  belongs_to :user 
  belongs_to :question

  validates :user, presence: true
  validates :question, presence: true
  validates :text, presence: true
end
