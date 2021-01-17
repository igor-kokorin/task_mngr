Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/projects', controller: 'project', action: 'get'
  post '/todos', controller: 'todo', action: 'create'
  patch '/projects/:id/todo/:todo_id', controller: 'project', action: 'update_todo'
end
