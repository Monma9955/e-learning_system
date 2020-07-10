class Page < ApplicationRecord
  belongs_to :article
  has_many :options, dependent: :delete_all
end
