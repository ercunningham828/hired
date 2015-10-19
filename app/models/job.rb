class Job < ActiveRecord::Base
  has_many :applications

  validates :title, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 50 }, presence: true
end
