class Header3Serializer < ActiveModel::Serializer
  attributes :data

  belongs_to :welcome
end
