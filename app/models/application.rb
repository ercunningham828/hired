class Application < ActiveRecord::Base
  belongs_to :job
  after_create :set_status

  def set_status
    self.status="New Application"
    self.save
  end
end
