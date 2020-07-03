class Page < ApplicationRecord
  belongs_to :article
  has_many :options
end
