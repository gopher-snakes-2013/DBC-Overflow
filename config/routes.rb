DbcOverflow::Application.routes.draw do
  root to: "submissions#index"
  resources :submissions, only: [:index, :new, :create, :show]
  resources :comments, only: [:new, :create]
end
