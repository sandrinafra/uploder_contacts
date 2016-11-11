Rails.application.routes.draw do

  resources :null_contacts
   root "imports#index"
  resources :contacts
  resources :imports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
