class CategoriesController < ApplicationController
  before_action :set_root_categories, only: [:index]

  def set_root_categories
    @root_categories = Category.root
  end
end
