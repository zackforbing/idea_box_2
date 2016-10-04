class Api::V1::IdeasController < ApplicationRecord
respond_to :json

  def index
    respond_with Idea.all
  end
end
