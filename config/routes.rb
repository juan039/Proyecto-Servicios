Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions', registrations: 'users/registrations'
      }

  resources :services do
  end

  # Rutas personalizadas para el controlador services

  get "/require_service/:id" => "services#require_service"
  get "/contracts" => "services#contracts"
  get "/accept_contract/:id" => "services#accept_contract"
  get "/close_contract/:id" => "services#close_contract"
  post "/require_service/:id" => "services#add_service"
  post "/close_contract/:id" => "services#save_score", as: "save_score"
  post "/cancel_contract/:id" => "services#cancel_contract", as: "cancel_contract"

  root to: "services#index"


  devise_scope :user do
      get "professional/register" =>"devise/registrations#service_provider_user_register"
  end

# devise_for :users,  :controllers => { :registrations => "users/registrations" } do
#   get "employee/register", :to => "devise/registrations#nuevo", :as => "employee_register"
# end

  devise_scope :user do
      get "users/sign_up/member" =>"users/registrations#register"
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
