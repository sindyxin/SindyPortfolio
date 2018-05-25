class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true
  #custom scope
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :My_great_project_subtitle, -> { where(subtitle: 'My great project') }
end
