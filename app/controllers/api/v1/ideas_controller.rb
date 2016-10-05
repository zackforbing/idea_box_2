class Api::V1::IdeasController < ApplicationController
  # protect_from_forgery with: :null_session
  respond_to :json

  def index
    render json: Idea.all.reverse
  end

  def create
    render json: Idea.create(idea_params)
  end

  def destroy
    Idea.find(params[:id]).destroy
    render nothing: true, status:  204
  end

  def update
    Idea.find(params[:id])
    
  private

    def idea_params
      params.permit(:title, :body)
    end
end
