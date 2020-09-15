class CategoriesController < ApplicationController
  before_action :set_root_categories, only: [:index, :show, :show_articles]

  def show
    @current_category = Category.find(params[:id])
    @current_category_children = @current_category.children
  end

  def show_articles
    @current_root_category = Category.find(params[:category_id])
    @current_root_category_children = @current_root_category.children
    @current_parent_category = Category.find(params[:id])
  end

  def set_root_categories
    @root_categories = Category.roots
  end
end
