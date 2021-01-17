class ProjectController < ApplicationController
  def get
    render json: Project.eager_load(:todos), include: :todos
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
