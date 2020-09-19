class Article < ApplicationRecord
  belongs_to :category, optional: true
  has_many :pages, dependent: :destroy

  enum format:{ multiple: 0, only_one: 1 }
  # multiple = 複数選択問題, only_one = 択一問題

  scope :new_order, -> { order(created_at: :desc) }
end
