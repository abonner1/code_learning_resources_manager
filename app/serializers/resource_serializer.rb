class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :description, :user_id, :language_id
end