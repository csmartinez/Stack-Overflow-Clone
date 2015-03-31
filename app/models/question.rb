class Question < ActiveRecord::Base
  belongs_to :user
  validates :body, :presence => true
  has_many :responses
end
