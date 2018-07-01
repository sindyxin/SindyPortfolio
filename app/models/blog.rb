class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, :body, :topic_id, presence: true
  belongs_to :topic
  has_many :comments, dependent: :destroy

  def self.special_blogs
    self.all
  end

  def self.featured_blogs
    limit(2)
  end
end
