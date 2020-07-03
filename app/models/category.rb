class Category < ApplicationRecord
  has_many :articles
  has_ancestry
end
