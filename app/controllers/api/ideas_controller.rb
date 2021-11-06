module Api
  class IdeasController < ApplicationController
    def index
      category = Category.find_by(name: params[:category_name])
      if category
        ideas = Idea.where(category_id: category.id)
      else
        ideas = nil
      end
      if ideas
        idea = ideas.map do |idea|
          {id: idea.id, category: idea.category.name, body: idea.body, created_at: idea.created_at}
        end
        render json: { status: 200,  data: idea }
      else
        head 404
      end
    end
    def create       
      if params[:category_name].blank? || params[:body].blank?
        head 422
      else
        category = Category.find_by(name: params[:category_name])
        unless category
          category = Category.create(name: params[:category_name])
        end
        category.ideas.build(body: params[:body]).save
        head 201
      end
    end
  end
end