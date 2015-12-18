TaskTracker::Application.routes.draw do

  root to: "static_pages#home"

  devise_for :users

  get "members/index", to: "members#index"

  get "static_pages/home"
  get "static_pages/access_denied", as: "access_denied"

  get "statistics/index", as: "statistics"
  get "statistics/by_tasks/:id", to: 'statistics#by_tasks', as: "by_tasks"
  get "statistics/project_stat", as: "project_stat"
  
  resources :roles
  resources :users
  resources :statuses

  resources :projects do
    resources :members
    resources :tasks    
    resources :task_members   
  end

  




  # patch 'add_member/:project_id', to: 'members#add_member', as: 'add_member'  
  # delete ':project_id/remove_member/:user_id', to: 'members#remove_member', as: 'remove_member'  

  # delete 'task_remove_worker/:task_id', to:'task#remove_worker', as:'task_remove_worker'
  # delete 'remove_task/:id', to:'user#remove_task', as:'remove_task'


  # delete ':id/remove_task/:task_id', to:'projects#remove_task', as:'remove_task'
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
