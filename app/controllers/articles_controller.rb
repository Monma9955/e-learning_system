class ArticlesController < ApplicationController
  def new
    @article = FormArticle.new
    @root_categories = Category.root
  end

end
