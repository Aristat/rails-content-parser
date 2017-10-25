class WebsiteContent < ApplicationRecord
  include PaginationModel

  belongs_to :website
  belongs_to :tag_name

  validates :name, presence: true
  validates :website_id, presence: true
  validates :tag_name_id, presence: true
end
