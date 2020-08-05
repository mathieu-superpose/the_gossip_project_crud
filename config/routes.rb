Rails.application.routes.draw do
  get 'cities/index'
  get 'cities/show'
  get 'cities/new'
  get 'cities/create'
  get 'cities/edit'
  get 'cities/update'
  get 'cities/destroy'
  #get 'gossips/show'
  root to:'welcome#show'

  get 'team', to: 'team#show'
  get 'contact', to: 'contact#show'
  get 'welcome/', to: 'welcome#show'
  get 'welcome/:first_name', to: 'welcome#show'
  #get 'gossips/:id', to: 'gossip#gossip', as:'gossip'

  #get 'profile/:first_name', to: 'profile#profile', as: 'profile'

  resources :profile
  resources :gossips
  resources :cities
  
end
