Rails.application.routes.draw do

  root to: "pokemons#index"
  resources :pokemons
  resources :battles do
    member do
      get :attack
    end
  end
end
