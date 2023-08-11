Rails.application.routes.draw do 
resources :users
post '/auth/login', to: 'authentication#login'
get '/*a', to: 'application#not_found'
post 'passwords/forgot', to: 'passwords#forgot'
post 'passwords/reset', to: 'passwords#reset'


get 'cards/show'
resources :products
root 'shops#index'
resource :cards, only: [:show]


get '/order_items/user_order_items', to: 'order_items#user_order_items', as: 'user_order_items'
resources :order_items, except: %i[show index]
resources :shops, only: %i[index show] 

end
