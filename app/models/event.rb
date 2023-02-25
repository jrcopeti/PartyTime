class Event < ApplicationRecord
  belongs_to :venues
  belongs_to :users
end
