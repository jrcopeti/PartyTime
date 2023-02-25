class Message < ApplicationRecord
  belongs_to :events
  belongs_to :users
end
