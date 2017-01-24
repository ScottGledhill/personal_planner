class Event < ApplicationRecord
  has_attached_file :image, :styles => { :original => "922x922>", :thumb => "220x220>" }
  validates_presence_of :place, :event, :image
  validates_attachment :image, :presence => true,
  :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }
end
