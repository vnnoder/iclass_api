IclassApi::Application.routes.draw do
  resources :user_device_tokens


  resources :votes


  resources :attendances


  devise_for :users

  resources :questions
  resources :talks
  resources :users

  namespace :api do
    devise_for :users
    #resources :registrations, :only => [:create]
    #resources :sessions, :only => [:create, :destroy]
    match '/sign_up' => 'registrations#create', :via => :post, :as => 'sign_up'
    match '/sign_in' => 'sessions#create', :via => :post, :as => 'sign_in'
    match '/sign_out' => 'sessions#destroy', :via => :delete, :as => 'sign_out'
    resources :talks, :only => [:create,:index]
    resources :talks do
      member do
        post 'join'
        post 'start'
        post 'close'
        post 'leave'
      end
      resources :questions, :only => [:create, :index]
      resources :questions do
        member do
          post 'vote'
        end
      end
    end
    match '/joined_talks' => 'talks#joined_talks', :via => :get, :as => 'joined_talks'
    match '/talks/passcode/:passcode' => 'talks#get_by_passcode', :via => :get, :as => 'get_by_passcode'
    match '/update_device_token' => 'users#update_device_token', :via => :post, :as => 'update_device_token'
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
