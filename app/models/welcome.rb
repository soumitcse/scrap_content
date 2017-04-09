class Welcome < ApplicationRecord
  has_many :header1s
  has_many :header2s
  has_many :header3s
  has_many :link_urls
end
