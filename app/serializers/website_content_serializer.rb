class WebsiteContentSerializer < ActiveModel::Serializer
  attributes :id, :name, :website_id, :tag_name_id

  belongs_to :tag_name
end
