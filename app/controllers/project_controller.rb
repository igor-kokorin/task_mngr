class ProjectController < ActionController::API
  def get
    render json: {
      message: 'ok'
    }
  end
end
