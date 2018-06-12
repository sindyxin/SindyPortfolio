class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda { |banana| banana['name'].blank? }

  # include Placeholder
  validates :title, :body, presence: true

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

    #custom scope
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")
  end
  scope :My_great_project_subtitle, -> { where(subtitle: 'My great project') }

  # after_initialize :set_default
  # def set_default
  #   #use concerns
  #   self.main_image ||= Placeholder.image_generator(height: "600", width:"400")
  #   self.thumb_image ||= Placeholder.image_generator(height: "350", width:"200")

    #self.main_image ||= "http://via.placeholder.com/600x400"
    #self.thumb_image ||= "http://via.placeholder.com/350x200"
  # end
  # :main_image, :thumb_image,
end


