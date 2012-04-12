Tracker::Application.routes.draw do
  
  resources :roles
  
  resources :people_tasks

  resources :projects_people

  resources :stopovers

  resources :priorities

  post 'tasks/:id/add' => 'tasks#add_task_assignee'
  post 'tasks/:id/remove' => 'tasks#remove_task_assignee'  
  get 'tasks/your_tasks' => 'tasks#your_tasks'
  resources :tasks

  #post 'add_team_member' => 'projects#add_team_member'
  post 'projects/:id/add' => 'projects#add_team_member'
  post 'projects/:id/remove' => 'projects#remove_team_member'
  resources :projects

  root :to => "application#home"
  get 'application/admin_panel' => 'application#admin_panel'
  get 'home' => 'application#index'
  
  get 'people/help' => 'people#help'
  post 'people/recover' => 'people#recover'
  resources :people

    #:collection => {:help => :get, :recover => :post}

  resources :sessions, 
    :member => {:recovery => :get}

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
  root :to => "application#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
