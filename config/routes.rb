DbcOverflow::Application.routes.draw do
  resources :submissions, only: [:index]
end
