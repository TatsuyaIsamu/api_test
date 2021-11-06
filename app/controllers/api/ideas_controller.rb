module Api
  class IdeasController < ApplicationController
    def create       
      if params[:category_name].blank? || params[:body].blank?
        head 422
      else
        category = Category.find_by(name: params[:category_name])
        unless category
          category = Category.create(name: params[:category_name])
        end
        category.ideas.build(body: params[:body]).save
        head :created
      end
    end
  end
end