Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'

  get '/shelters/:id/pets', to: 'shelters#pets'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/shelters/:id/pets/new', to: 'pets#new'
  delete '/pets/:id', to: 'pets#destroy'

  get '/pets/:id/favorite', to: 'pets#toggle_favorite'
  post '/pets/:id/favorites', to: 'pets#toggle_favorite'
  post '/pets/:id/favorite', to: 'pets#toggle_favorite'
  get '/favorites', to: 'pets#favorites'
  get '/favorites', to: 'pets#index'
  get '/favorites/delete', to: 'pets#delete_favorites'

  get '/shelters/:id/reviews', to: 'reviews#new'
  post '/shelters/:id', to: 'reviews#create'
  get '/reviews/:id/edit', to: 'reviews#edit'
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy'

  get '/applications/new', to: 'applications#new'
  post '/applications', to: 'applications#create'
end
