class Event < ApplicationRecord
  validates_presence_of :place, :event
end
