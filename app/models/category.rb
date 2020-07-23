class Category < ApplicationRecord
  has_many :articles, dependent: :nullify
  has_ancestry

  validates :name, presence: true

  def self.root
    Category.where(ancestry: nil)
  end
end
