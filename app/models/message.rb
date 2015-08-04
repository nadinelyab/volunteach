class Message < ActiveRecord::Base
  belongs_to :user

  validates :receiver_id, :body, :title, presence: true
end
