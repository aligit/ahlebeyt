Rails.application.routes.draw do
  ## The url to sign-in is: localhost:3000/users/seconnecter
  devise_for :users, path_names: {sign_in: :seconnecter, sign_out: :logout}
  mount Ckeditor::Engine => '/ckeditor'
  resources :events do
    collection do
      #localhost:3000/event/upcomings.json
      get 'upcomings'
    end
  end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get "azan/index"
  get "azan/download"

  get "home/index"
  get "home/about"
  get "home/contact"
  get "home/event"
  get "home/don"
  get "home/ecole"

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
  root :to => 'home#index'
end
