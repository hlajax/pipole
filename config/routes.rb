Rails.application.routes.draw do
  resources :rubriques
  devise_for :lecteurs 
  resources :articles do
  member do
   put "like", to: "articles#upvote"
   put "dislike", to: "articles#downvote"
  end
end
  root 'articles#index'
   devise_scope :lecteur do
    get '/lecteurs/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
