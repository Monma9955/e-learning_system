class Article < ApplicationRecord
  belongs_to :category, optional: true
  has_many :pages, dependent: :destroy
end
