Rails.application.routes.draw do

  scope '(:locale)', locale: /es|en/ do
    devise_for :users

    resources :days
    resources :menus

    get '/menus/new/:shop' => 'menus#new'
    get '/menus/edit/:id' => 'menus#edit'

    post '/days/addmenu(/:day(/:menu))' => "days#add_menu"
    post '/days/deletemenu(/:day(/:menu))' => "days#delete_menu"
    #post '/admin/addmenu(/:day(/:menu))' => "admin#add_menu"
    #post '/admin/deletemenu(/:day(/:menu))' => "admin#delete_menu"

    get '/newmenu/:shop' => "admin#new_menu"
    get 'admin/index(/:id(/:day))' => "admin#index"
    get '/admin' => "admin#index"
    get 'admin/select_shop'
    get 'admin/request_shop/:id' => 'admin#request_shop'
    get 'admin/choose_shop' => 'admin#choose_shop'

    root to: 'main#index'

    get 'main/index'
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
