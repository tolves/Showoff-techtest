Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'sessions/create'
  post 'sessions/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'widget/index'
  post 'widget/index'
  root 'widget#index'

end
