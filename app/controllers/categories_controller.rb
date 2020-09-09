class CategoriesController < ApplicationController
  before_action :set_root_categories, only: [:index, :show]

  def show
    @current_category_children = Category.find(params[:id]).children
  end

  def set_root_categories
    @root_categories = Category.roots
  end
end
