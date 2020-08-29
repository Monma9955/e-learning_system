class FormArticle
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :created_user_id, :integer
  attribute :article_category, :integer
  attribute :article_format, :integer
  attribute :article_title, :string
  attribute :page_text, :string
  attribute :option_correct, :string
  attribute :option_wrong, :string
  attribute :article_price, :integer
  attribute :article_time_limit, :integer
  attribute :article_public, :boolean

  validates :created_user_id, presence: true, numericality: { only_integer: true }
  validates :article_category, presence: true, numericality: { only_integer: true }
  validates :article_format, presence: true, inclusion: 0..1
  validates :article_title, presence: true, length: { maximum: 30 }
  validates :page_text, presence: true, length: { maximum: 1000 }
  validates :option_correct, presence: true, length: { maximum: 200 }
  validates :option_wrong, presence: true, length: { maximum: 200 }
  validates :article_price, inclusion: 100..999_999, allow_nil: true
  validates :article_time_limit, inclusion: 1..120, allow_nil: true

  def save
    return false unless valid?
    article = Article.new(user_id: created_user_id,
                          category_id: article_category,
                          title: article_title,
                          price: article_price,
                          format: article_format,
                          time_limit: article_time_limit,
                          public: article_public)
    article.save

    page = article.pages.build(text: page_text)
    page.save

    option = page.options.build(answer: option_correct, correct: true)
    option.save

    page.options.create(answer: option_wrong, correct: false)
  end
end