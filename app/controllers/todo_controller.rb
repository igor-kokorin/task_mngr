class TodoController < ApplicationController
  def create
    project_title = params[:project_title]
    project_id = params[:project_id]

    todo = Todo.transaction do
      if project_title.present?
        project = Project.create!(title: project_title)
      elsif project_id.present?
        project = Project.find(project_id)
      else
        raise Exceptions::ApiError.new(400, 'You must pass either project_title of project_id, they should be nonempty')
      end

      Todo.create!(
        text: params[:text],
        project_id: project.id
      )
    end

    render json: todo
  end
end
