Rails.application.routes.draw do
  put 'users/update'
  post 'users/resetpwd'
  post 'users/changepwd'
  post 'users/register'
  get 'users/index_me'
  post 'users/index_me'
  post 'users/check_email'

  post 'sessions/create'
  post 'sessions/logout'

  get 'widget/index'
  post 'widget/index'
  root 'widget#index'
  post 'widget/create'
  put 'widget/update'
  delete 'widget/delete'

end
