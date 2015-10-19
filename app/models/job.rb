class Job < ActiveRecord::Base
  has_many :applications

  validates :title, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 50 }, presence: true
  
  default_scope { order('created_at DESC') }
  
  extend FriendlyId
  friendly_id :title, use: :slugged
end
