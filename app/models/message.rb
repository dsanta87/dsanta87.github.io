class Message < ApplicationRecord
  #Associations
  belongs_to :user

  #Validations
  validates_presence_of :body
  belongs_to :user
end
