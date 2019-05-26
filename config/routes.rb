Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/tasks/batch_create', to: 'tasks#batch_create'
  patch '/tasks/cat_indexes', to: 'tasks#update_cat_indexes'
  patch '/tasks/time_indexes', to: 'tasks#update_time_indexes'
  resources :tasks, only: [:create, :index, :update, :destroy]
end
