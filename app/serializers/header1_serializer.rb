class Header1Serializer < ActiveModel::Serializer
  attributes :data

  belongs_to :welcome
end
