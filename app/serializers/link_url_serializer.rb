class LinkUrlSerializer < ActiveModel::Serializer
  attributes :data

  belongs_to :welcome
end
