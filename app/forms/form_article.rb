class FormArticle
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :article_created_user, :integer
  attribute :article_category, :string
  attribute :article_format, :integer
  attribute :article_title, :string
  attribute :page_text, :string
  attribute :option_correct, :string
  attribute :option_wrong, :string
  attribute :article_price, :integer
  attribute :article_time_limit, :integer
  attribute :article_public, :boolean

  validates :article_category, presence: true
  validates :article_format, presence: true
  validates :article_title, presence: true
  validates :page_text, presence: true
  validates :option_correct, presence: true
  validates :option_wrong, presence: true
  validates :article_price, inclusion: 100..999_999, allow_nil: true
  validates :article_time_limit, inclusion: 0..120, allow_nil: true

  def save
    return false unless valid?
    article = Article.new(user_id: article_created_user,
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