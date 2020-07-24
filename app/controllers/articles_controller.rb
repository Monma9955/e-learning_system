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

end
