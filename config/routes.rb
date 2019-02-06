Rails.application.routes.draw do
devise_for :users, :controllers => { registrations: 'registrations' }

  get '/admins', to: 'admins#show'
  get '/newflight', to: 'phlights#new'
  get '/showflight', to: 'phlights#show'
  post '/newflight', to: 'phlights#create'
  get '/addairplane', to: 'phlights#addairplane'
  get '/addplanees', to: 'phlights#addplane'
  get '/newairplane', to: 'airplanes#new'
  post '/newairplane', to: 'airplanes#create'
  get '/newseatconfig', to: 'seatconfigs#new'
  post '/newseatconfig', to: 'seatconfigs#create'
  get '/newseatcat', to: 'seatcats#new'
  post '/newseatcat', to: 'seatcats#create'
  get '/newseatprofile', to: 'seats#new'
  post '/newseatprofile', to: 'seats#create'
  get '/showsconfig', to: 'seatconfigs#show'
  get '/addconfig', to: 'airplanes#add'
  get '/addconfiguration', to: 'airplanes#addconfiguration'
  get '/addconfig1', to: 'airplanes#postadd'
  get '/airplanesshow', to: 'airplanes#show'
  post '/search', to: 'searchs#createsearch'
  get '/search', to: 'searchs#error'
  get '/bookseat', to: 'bookings#new'
  post '/selectseat', to: 'bookings#select'
  get '/selectinvalid', to: 'bookings#invalid'
  get '/seeprice', to: 'bookings#seeprice'
  get '/confirm', to: 'bookings#confirm'
  authenticated :user do
   root 'pages#logger', as: :authenticated_root
 end

 root to:'pages#index'

 resources :phlight
 resources :airplane
 resources :seatconfig do
   resources :seatcat do
     resources :seat

resources :booking do
  resources :tempseat
end
   end
 end

 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
