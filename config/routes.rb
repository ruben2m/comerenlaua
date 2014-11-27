Rails.application.routes.draw do


  scope '(:locale)', locale: /es|en|ca/ do
    devise_for :users

    namespace :api do
      namespace :v1 do
        devise_scope :user do
          post 'sessions' => 'sessions#create', :as => 'login'
          delete 'sessions' => 'sessions#destroy', :as => 'logout'
        end
        #get 'tasks' => 'tasks#index', :as => 'tasks'
        #post 'tasks' => 'tasks#index', :as => 'tasks_post'
        put 'sube_foto' => 'tasks#sube_foto', :as => 'tasks_put'
        get 'get_foto' => 'tasks#descarga_foto', :as => 'task_get_foto'
        get 'delete_foto' => 'tasks#elimina_foto', :as => 'task_elimina_foto'
      end
    end

    resources :days
    resources :menus

    get '/menus/new/:shop' => 'menus#new'
    get '/menus/edit/:shop/:id' => 'menus#edit'

    post '/days/addmenu(/:day(/:menu))' => "days#add_menu"
    post '/days/deletemenu(/:day(/:menu))' => "days#delete_menu"
    #post '/admin/addmenu(/:day(/:menu))' => "admin#add_menu"
    #post '/admin/deletemenu(/:day(/:menu))' => "admin#delete_menu"

    get '/newmenu/:shop' => "admin#new_menu"
    get 'admin/index(/:shop(/:day))' => "admin#index"
    get '/admin(/:shop)' => "admin#index", as: "admin"
    get '/select_shop' => "admin#select_shop", as: "admin_select_shop"
    get '/request_shop/:id' => 'admin#request_shop'
    get '/choose_shop' => 'admin#choose_shop', as: "admin_choose_shop"
    get '/mobile_privado' => 'admin#get_mobile_data'
    get '/mobile_publico' => 'main#get_mobile_data'


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
