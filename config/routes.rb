Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

#API Routes
#A way to link up to the controller
# react side to use


#http request
#commnunicate in the browser
#have react communicate to the rails side
# GET -> READ
# POST -> Create
# PUT / PATCH -> update
# DELETE -> destroy

namespace :api do
#where all our routes will be
# http verb 'url path', to: 'controller#action'
# get '/people', to: 'people#index'


#this will create all of the routes for all base crud actions
resources :subs do
resources :topics
end
# resources :subs, only: [:index, show:, :update]
# resources :subs, except: [:create, :destroy]

#if you want to add a route with a model of parent and child
#always go two levels deep at most

# resources :parents do
#   resources :child
# end
resources :topics, except: [:index, :show, :update, :create, :destroy] do
resources :comments
end
# resources :comments, except: [:index, :show, :update, :create, :destroy]
# resources :likes
end
# :id or :parent_id = placeholder for the acual value



