class Api::V1::IdeasController < ApplicationController
  # protect_from_forgery with: :null_session
  respond_to :json

  def index
    render json: Idea.all.order(id: :desc)
  end

  def create
    render json: Idea.create(idea_params)
  end

  def destroy
    Idea.find(params[:id]).destroy
    render nothing: true, status:  204
  end

  def update
    idea = Idea.find(params[:id])
    if params[:upvote]
      idea.upvote
    elsif params[:downvote]
      idea.downvote
    else
      idea.update_attributes(idea_params)
      render json: idea
    end
  end

  private

    def idea_params
      params.permit(:title, :body, :upvote, :downvote)
    end
end
