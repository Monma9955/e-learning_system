class ArticlesController < ApplicationController
  def new
    @article = FormArticle.new
    @root_categories = Category.root
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

  private
  def article_params
    params.require(:form_article).permit(:article_category,
                                    :article_title,
                                    :article_price,
                                    :article_format,
                                    :article_time_limit,
                                    :article_public,
                                    :page_text,
                                    :option_correct,
                                    :option_wrong
                                    ).merge(article_created_user: current_user.id)
  end
end
