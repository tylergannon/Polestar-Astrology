PolestarAstrology::Application.routes.draw do
  resources :star_groups
  
  resources :comments

  resources :chart_palaces do
    resources :star_relationships
    resources :comments
  end

  resources :articles

  resources :charts, controller: 'people', as: 'people' do
    # resource :chart, :only => :show
    resources :palaces, controller: 'chart_palaces', as: 'chart_palaces', only: [:show], key: :foobax
  end
  
  get '/tong_shu/week/(:week)' => 'tong_shus#week_of', :as => 'tong_shu_week'
  get '/tong_shu/:year/:month' => 'tong_shus#index', :as => 'tong_shu_index'
  
  resources :feedback, controller: 'feedbacks', as: 'feedbacks'
  resources :tong_shus
  
  resources :stars, :only => [:index, :show] do
    resources :comments
  end
  
  resources :star_palaces do
    resources :comments
  end
  
  resources :branches, :only => [:index, :show] do
    resources :comments
  end
  
  resources :elements, :only => [:index, :show] do
    resources :comments
  end
  
  resources :stems_and_branches, controller: 'pillars', as: 'pillars', :only => [:index, :show] do
    resources :comments
  end
  
  resources :lunar_dates, only: [:show], format: :json
  
  resources :search, only: [:index, :create]
  
  resources :star_relationships do
    resources :comments
  end
  
  resources :palaces do
    resources :star_relationships do
      put :sort, on: :collection
    end
    get 'by_star/:star_id', :action => :show, :on => :member
  end
  
  namespace :admin do
    resources :members
  end

  devise_for :members
  
  devise_scope :member do
    get "sign_out", :to => "devise/sessions#destroy"
  end  
  
  resources :passwords, :only => [:edit, :update], controller: 'change_passwords'
  get '/change_password' => 'change_passwords#edit', :as => :change_password
  get '/updates' => 'articles#index', :as => :blog

  root :to => 'people#index'

end
