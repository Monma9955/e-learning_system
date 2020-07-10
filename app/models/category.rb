class Category < ApplicationRecord
  has_many :articles, dependent: :nullify
  has_ancestry
end
