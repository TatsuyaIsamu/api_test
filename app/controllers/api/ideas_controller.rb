module Api
  class IdeasController < ApplicationController
    def create
      category = Category.find_by(name: params[:category_name])
      unless category
        category = Category.create(name: params[:category_name])
      end
      category.ideas.build(body: params[:body]).save
      head :created
    end
  end
end