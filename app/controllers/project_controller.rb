class ProjectController < ApplicationController
  def get
    render json: {
      message: 'ok'
    }
  end
end
