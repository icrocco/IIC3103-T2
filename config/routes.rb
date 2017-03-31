Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  put '/usuario' => "usuarios#create", as: :put_usuario
  get '/usuario/:id' => "usuarios#show", as: :get_usuario
  get '/usuario' => "usuarios#index", as: :get_todos_usuarios
  delete '/usuario/:id' => "usuarios#destroy", as: :delete_usuario
  post '/usuario/:id' => "usuarios#update", as: :post_usuario
end
