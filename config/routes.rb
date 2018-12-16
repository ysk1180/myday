Rails.application.routes.draw do
  get 'terms', to: 'terms#index', as: :terms
  get 'privacy', to: 'privacies#index', as: :privacy
  resources :posts, only: [:create]
  root to: 'posts#new'
  post 'make', to: 'posts#make'
  get 'year', to: 'posts#year', as: :year
  post 'make_year', to: 'posts#make_year'
  get 'radar', to: 'posts#radar', as: :radar
  post 'make_radar', to: 'posts#make_radar'
end
