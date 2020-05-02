Rails.application.routes.draw do
  devise_for :receivers
  devise_for :advisors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#toppage"
 
#下記の2つのdeviseをresourceに変える 


 #  resources :receivers, only: []

  # devise_for :receivers, controllers: {
  #   sessions:      'receivers/sessions',
  #   passwords:     'receivers/passwords',
  #   registrations: 'receivers/registrations'
  # }

#  resources :advisors, only: []

  # devise_for :advisors, controllers: {
  #   sessions:      'advisors/sessions',
  #   passwords:     'advisors/passwords',
  #   registrations: 'advisors/registrations'
  # }

  # devise_scope :receivers do
  #   delete 'logout', to: 'devise/sessions#destroy'
  #   # get "sign_out", :to => "devise/sessions#destroy" 
  # end

end

