class CategoriesController < ApplicationController
  before_action :set_root_categories, only: [:index, :show]

  def show
    @current_category = Category.find(params[:id])
    @current_category_children = @current_category.children
  end

  def set_root_categories
    @root_categories = Category.roots
  end
end
