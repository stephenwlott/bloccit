Rails.application.routes.draw do 
  #get 'summaries/create'
  #get 'summaries/show'

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end
  resources :summary, except: [:index, :edit, :update, :destroy]
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
