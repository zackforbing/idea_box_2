class Api::V1::IdeasController < ApplicationController
  # protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with Idea.all
  end

  def create
    respond_with Idea.new(idea_params)
  end

  private

    def idea_params
      params.permit(:title, :body)
    end
end
