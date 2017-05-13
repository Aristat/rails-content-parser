class WebsiteContent < ApplicationRecord
  belongs_to :website
  belongs_to :tag_name

  validates :name, presence: true
  validates :website_id, presence: true
  validates :tag_name_id, presence: true

  # todo: replace as_json to gem active_model_serializers
  def as_json(options={})
    super(
      except: [:created_at, :updated_at],
      include: {
        tag_name: {only: [:name]}
      }
    )
  end
end