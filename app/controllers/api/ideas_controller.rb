module Api
  class IdeasController < ApplicationController
    def create
      category = Category.create(name: params[:category_name])
      idea = category.ideas.build(body: params[:body]).save
      head :created
    end
  end
end