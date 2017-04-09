class Header2Serializer < ActiveModel::Serializer
  attributes :data

  belongs_to :welcome
end
