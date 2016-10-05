class Api::V1::IdeasController < ApplicationController
  # protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with Idea.all.reverse
  end

  def create
    render json: Idea.create(idea_params)
  end

  private

    def idea_params
      params.permit(:title, :body)
    end
end
