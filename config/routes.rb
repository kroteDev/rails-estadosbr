Rails.application.routes.draw do
  resources :estados, defaults: { format: :json } do
    resources :cidades
  end
  get "/cidades/:nome", to: "cidades#nome"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
