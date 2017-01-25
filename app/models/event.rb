class Event < ApplicationRecord
  # note user owns the event
  # users are the people who attended the event
  has_attached_file :image, :styles => { :original => "922x922>", :thumb => "220x220>" }
  validates_presence_of :place, :event, :image
  validates_attachment :image, :presence => true,
  :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }
  has_many :comments
  belongs_to :user
  has_many :attendances # looks in the attendances table for all attendances with event_id == id
  has_many :users, through: :attendances # looks in the attendances returned from event.attendances, then finds all users with the id = attendance.user_id
end

# event.user_id == 9
# user = event.user #<- the user method comes from the belongs_to class method. Calling this method looks in the db for the user with id == user_id
# user.id = 9
#
#
# event.id == 9
# comments = event.comments
# comment = comments.first
# comment.event_id == 9§
