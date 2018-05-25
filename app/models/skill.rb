class Skill < ApplicationRecord
  include Placeholder
  validates :title, :percent_utilized, presence: true

  after_initialize :set_default
  def set_default
    self.badge ||= Placeholder.image_generator(height:"250", width:"250")
    #self.badge ||= "http://via.placeholder.com/250x250"
  end
end
