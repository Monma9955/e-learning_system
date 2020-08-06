class ArticlesController < ApplicationController
  before_action :set_root_categories, only: [:new, :create]

  def new
    @article = FormArticle.new
  end

  def create
    @article = FormArticle.new(article_params)
    if @article.save
      redirect_to root_path, notice: "問題を作成しました"
    else
      flash.now[:alert] = "問題の作成に失敗しました"
      render :new
    end
  end

  def set_root_categories
    @root_categories = Category.root
  end

  # 以下json formatのアクション
  def get_category_parents
    # 選択されたルートカテゴリに紐付く親カテゴリの配列を取得
    @category_parents = Category.find_by(id: "#{params[:root_id]}",ancestry: nil).children
  end

  def get_category_children
    # 選択された親カテゴリに紐付く子カテゴリの配列を取得
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  private
  def article_params
    params.require(:form_article).permit(:article_category,
                                    :article_title,
                                    :article_price,
                                    :article_time_limit,
                                    :article_public,
                                    :page_text,
                                    :option_correct,
                                    :option_wrong
                                    ).merge(created_user_id: current_user.id,
                                            article_format: 0)
  end
end
