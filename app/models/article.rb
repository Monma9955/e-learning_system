class Article < ApplicationRecord
  belongs_to :category, optional: true
  has_many :pages, dependent: :destroy

  enum format:{only_one: 0, multiple: 1}
  # only_one = 択一問題、 multiple = 複数選択問題
end
