class Website < ApplicationRecord
  include PaginationModel

  has_many :website_contents, dependent: :destroy

  validates :url, presence: true,
                  format: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/ix
end