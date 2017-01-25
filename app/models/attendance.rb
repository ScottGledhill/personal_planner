class Attendance < ApplicationRecord
  validates :user, uniqueness: true
  belongs_to :event
  belongs_to :user
end
