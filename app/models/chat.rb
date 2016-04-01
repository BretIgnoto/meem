class Chat < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :link, presence: true
end
