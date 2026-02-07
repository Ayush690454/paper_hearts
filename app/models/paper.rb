class Paper < ApplicationRecord
  belongs_to :wall

  after_initialize :set_defaults

  private

  def set_defaults
    self.x ||= rand(-100..100)
    self.y ||= rand(-100..100)
    self.rotation ||= rand(-15..15)
    self.z_index ||= 1
    self.paper_type ||= "note"
  end
end
