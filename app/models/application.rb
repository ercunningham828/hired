class Application < ActiveRecord::Base
  belongs_to :job
  after_create :set_status

  scope :fresh, -> { where(status: 'New Application') } 
  scope :review, -> { where(status: 'Under Review') } 
  scope :rejected, -> { where(status: 'Rejected') } 
  scope :hired, -> { where(status: 'Hired') } 

  def set_status
    self.status="New Application"
    self.save
  end
end
