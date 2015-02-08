Rails.application.routes.draw do


root 'users#index'

get '/users/new' => 'users#new'                                     #gets 'create new user' view
post '/users/create' => 'users#create'                              #post to create a new user

post '/sessions/create' => 'sessions#create'                         #post to start a session at login 
post '/sessions/destroy' => 'sessions#destroy'                       #post to end a session at logout

get '/articles' => 'articles#index'                                 #landing page (shows all articles)
post '/articles/create' => 'articles#create'                        #post a pending article to articles
get '/articles/:id' => 'articles#view'                              #shows a specific article and its comments
post '/articles/destroy' => 'articles#destroy'                     #deletes accepted articles


get '/pending' => 'p_articles#index'                                #landing admin page (shows all pending articles)
post '/pending/create' => 'p_articles#create'                       #post that accepts a pending
post '/pending/destroy' => 'p_articles#destroy'                     #post that accepts a pending

post '/articles/:id/comments' => 'comments#create'                     #post to post a comment to article :id
post '/articles/:id/comments/:id/subcomments' => 'subcomments#create'  #post to post a subcomment to a comment


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
