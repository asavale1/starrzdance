Starrzdance::Application.routes.draw do

  root 'static_pages#home'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/achievements', to: 'static_pages#achievements', via: 'get'
  match '/faq', to: 'static_pages#faq', via: 'get'
  match '/schedule', to: 'static_pages#schedule', via: 'get'
  match '/register', to: 'static_pages#register', via: 'get'
  match '/register_new', to: 'static_pages#register_new', via: 'post' 

  # => Admin Routes 
  match '/admin', to: 'admin#home', via: 'get'
  match '/edit_photo', to: 'admin#photo', via: 'get'
  match '/edit_video', to: 'admin#video', via: 'get'
  
  match '/edit_faq', to: 'admin#faq', via: 'get'
  match '/edit_faq_new', to: 'admin#faq_new', via: 'post'
  match '/edit_faq_edit', to: 'admin#faq_edit', via: 'post'

  match '/edit_achievements', to: 'admin#achievements', via: 'get'
  match '/edit_achievements_new', to: 'admin#achievements_new', via: 'post'
  match '/edit_achievements_edit', to: 'admin#achievements_edit', via: 'post'

  match '/edit_about', to: 'admin#about', via: 'get'
  match '/edit_about_new', to: 'admin#about_new', via: 'post'
  match '/edit_about_edit', to: 'admin#about_edit', via: 'post'

  match '/edit_schedule', to: 'admin#schedule', via: 'get'
  match '/edit_schedule_new', to: 'admin#schedule_new', via: 'post'
  match '/edit_schedule_update', to: 'admin#schedule_update', via: 'post'

  match '/edit_student', to: 'admin#student', via: 'get'
  # get "static_pages/home"
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
