PocBank::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'about', :to => "home#about", :as => :about
  get 'partner', :to => "home#partner", :as => :partner

  namespace :admin do
    root to: 'dashboards#show'
    resource :dashboard, :only => [:show]
    resources :users
    resources :credits
    resources :debits
    resources :providers
    resources :categories
    resources :user_types
  end

  resources :credits, :only => [:index, :show] do
    collection do
      get 'providers/:id' => "providers#credit_show", :as => :provider
    end
    get 'redirect'
    post 'shortlist', :to => "credits#add_to_shortlist"
    delete 'shortlist', :to => "credits#remove_from_shortlist"
  end
  resources :debits, :only => [:index, :show] do
    collection do
      get 'providers/:id' => "providers#debit_show", :as => :provider
    end
    get 'redirect'
    post 'shortlist', :to => "debits#add_to_shortlist"
    delete 'shortlist', :to => "debits#remove_from_shortlist"
  end

  get 'providers/:id/redirect' => "providers#redirect", :as => :provider_redirect

  resources :locations do
    collection { post :import}
  end
end
