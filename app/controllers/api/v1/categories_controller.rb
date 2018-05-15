class Api::V1::CategoriesController < ApplicationController
  def index
    categories = Category.all.desc
    json_response categories
  end
end
