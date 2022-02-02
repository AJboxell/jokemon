Rails.application.routes.draw do

  resources :pokemons
  resources :battles do
    member do
      get :attack
      get :defend
    end
  end
end
