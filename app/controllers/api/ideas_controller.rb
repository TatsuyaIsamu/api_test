module Api
  class IdeasController < ApplicationController
    def index
      if params[:category_name] == ''
        ideas = Idea.all
      else
        category = Category.find_by(name: params[:category_name])
        ideas = (Idea.where(category_id: category.id) if category)
      end
      if ideas
        ideas = ideas.map do |idea|
          { id: idea.id, category: idea.category.name, body: idea.body,
            created_at: Time.parse(idea.created_at.to_s).to_i }
        end
        render json: { status: 200, data: ideas }
      else
        head 404
      end
    end

    def create
      if params[:category_name].blank? || params[:body].blank?
        head 422
      else
        category = Category.find_by(name: params[:category_name])
        category ||= Category.create(name: params[:category_name])
        category.ideas.build(body: params[:body]).save
        head 201
      end
    end
  end
end
