Rails.application.routes.draw do
  resources :authentications

  resources :books
  resources :home
  post 'home/search'
  root to: "home#index"
  # devise_for :users
  devise_for :users, :path_names=> {:sign_up=> "signup",:sign_in=> "login", :sign_out=> "logout"}, :controllers => { :registrations => "registration/registrations" }
  # devise_scope :user do
  #     get 'logout' => 'devise/sessions#destroy'
  #   end
  devise_scope :user do
    # match '/registration/registrations/update' => 'registrations#update', :as => :update
    match '/registration/registrations/create' => 'registrations#create', :via => :get, :as => :create
    match '/auth/:provider/callback' => 'authentications#create', :via => :get
    # match '/registration/registrations/update' => 'registrations#update', :as => :update
    # match '/registration/registrations/create' => 'registrations#create', :as => :create
    # match '/registration/registrations/update_accordion' => 'registrations#update_accordion', :as => :update_accordion
    # match '/registration/registrations/user_profile_image' => 'registrations#user_profile_image', :as => :user_profile_image
    # match '/registration/registrations/user_profile_image_admin' => 'registrations#user_profile_image_admin', :as => :user_profile_image_admin
    # match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
    # match '/user/confirmation/showconfirmation' => 'confirmations#showconfirmation', :via => :get
    # match '/user/edit_password' => 'registrations#edit_password', :via => :get, :as => :edit_password
    # match '/user/reset_password' => 'registrations#reset_password', :via => :get, :as => :reset_password
    # match '/user/update_password' => 'registrations#update_password', :via => :put, :as => :update_password
    # match '/user/getimageupload' => 'registrations#getimageupload', :via => :put, :as => :getimageupload
    # match '/registrations/register_for_admin' => 'registrations#register_for_admin', :as => :register_for_admin
    # match '/registrations/create_for_admin' => 'registrations#create_for_admin', :as => :create_for_admin
    get 'logout' => 'devise/sessions#destroy'
end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
