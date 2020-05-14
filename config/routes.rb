Rails.application.routes.draw do
  get 'talkrooms/show'
  post 'member_chats/new' => 'member_chats#new'
  devise_for :receivers, controllers: {   registrations: 'receivers/registrations',
                                          sessions: 'receivers/sessions' }

  devise_for :advisors, controllers: {   registrations: 'advisors/registrations',
                                         sessions: 'advisors/sessions' }

  root to: "posts#toppage"
  resources :member_chats, only: [:index, :new, :create, :show]
  resources :receivers, only: [:show]
  resources :talkrooms, :only => [:show, :create] do
    resources :messages, :only => [:create]

end
end

