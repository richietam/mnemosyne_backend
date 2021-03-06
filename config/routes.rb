Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :show, :update, :create]
    resources :albums
    delete '/users', to: 'users#deleteImage'
    delete '/image', to: 'albums#deleteImage'
    delete '/album', to: 'albums#deleteAlbum'
    post '/login', to: 'auth#login'
    get '/auto_login', to: 'auth#auto_login'
    get '/current_album', to: 'albums#current_album'
    post '/follow', to: 'users#createFollowing'
    delete '/follow', to: 'users#deleteFollowing'

  end
end
