class Post < ActiveRecord::Base
  belongs_to :moderator
  has_many :post_tags, dependent: :destroy
  has_many :tags, through:  :post_tags
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true



#refactoring
  def self.matching_title_or_content search
    where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
end

end
