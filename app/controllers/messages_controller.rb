class MessagesController < ApplicationController
  validates :content
  belongs_to :user
end
