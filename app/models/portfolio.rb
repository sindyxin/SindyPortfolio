class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true
    #custom scope
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :My_great_project_subtitle, -> { where(subtitle: 'My great project') }

  after_initialize :set_default
  def set_default
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
end


