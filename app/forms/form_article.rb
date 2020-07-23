class FormArticle
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :article_category, :string
  attribute :article_format, :integer
  attribute :article_title, :string
  attribute :page_text, :string
  attribute :option_correct, :boolean
  attribute :option_wrong, :boolean
  attribute :article_price, :integer
  attribute :article_time_limit, :integer
  attribute :article_public, :boolean

  validates :article_category, presence: true
  validates :article_format, presence: true
  validates :article_title, presence: true
  validates :page_text, presence: true
  validates :option_correct, presence: true
  validates :option_wrong, presence: true
  validates :article_price, presence: true
  validates :article_time_limit, presence: true
  validates :article_public, presence: true

end