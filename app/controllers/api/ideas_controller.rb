module Api
  class IdeasController < ApplicationController

    def index
      unless params[:category_name] == ""
        category = Category.find_by(name: params[:category_name])
        if category
          ideas = Idea.where(category_id: category.id)
        else
          ideas = nil
        end
      else
        ideas = Idea.all
      end
      if ideas
        idea = ideas.map do |idea|
          {id: idea.id, category: idea.category.name, body: idea.body, created_at: Time.parse("#{idea.created_at}").to_i}
        end
        binding.irb
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