class ProjectController < ApplicationController
  def get
    projects = Project.eager_load(:todos).order("projects.created_at ASC, todos.created_at ASC")

    render json: projects, include: :todos
  end

  def update_todo
    todo = Todo.find_by!(
      id: params[:todo_id],
      project_id: params[:id]
    )

    todo.update!(is_completed: params[:is_completed])

    render json: todo
  end
end
