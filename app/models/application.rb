class Application < ActiveRecord::Base
  mount_uploader :resume, ResumeUploader
  mount_uploader :coverletter, CoverletterUploader

  belongs_to :job
  after_initialize :set_status

  validates :name, length: { minimum: 5 }, presence: true
  validates :email, length: { minimum: 10 }, presence: true
  validates :phone,:resume,:coverletter, presence: true

  default_scope { order('created_at DESC') }
  scope :fresh, -> { where(status: 'New Application') } 
  scope :review, -> { where(status: 'Under Review') } 
  scope :rejected, -> { where(status: 'Rejected') } 
  scope :hired, -> { where(status: 'Hired') } 

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  def set_status
    self.status="New Application"
  end
end
