Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  put '/usuario' => "usuarios#create", as: :put_usuario
  get '/usuario/:id' => "usuarios#show", as: :get_usuario
end
