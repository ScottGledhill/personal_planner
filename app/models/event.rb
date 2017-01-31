class Event < ApplicationRecord
  has_attached_file :image, :styles => { :original => "922x922>", :thumb => "220x220>" }
  validates_presence_of :place, :event, :image
  validates_attachment :image, :presence => true,
  :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendance
  after_create :log_event

  private

  def log_event
    puts "lol" * 25
    pp self
    puts "lol" * 25
  end
end
