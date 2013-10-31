DbcOverflow::Application.routes.draw do
  root to: "submissions#index"
  resources :submissions, only: [:index, :new, :create]
end
