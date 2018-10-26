Rails.application.routes.draw do
  root to: 'home#index'
  get '/recipes/details/:id', to: 'home#recipe_details', as: 'details_recipe'
end
