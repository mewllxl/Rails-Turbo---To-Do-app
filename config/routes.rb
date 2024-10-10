Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :destroy]

  get 'tasks/incomplete', to: 'tasks#incomplete', as: 'incomplete_tasks'
  get 'tasks/complete', to: 'tasks#complete_tasks', as: 'complete_tasks'
  get 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
end
