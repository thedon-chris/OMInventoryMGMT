Rails.application.routes.draw do

  get 'calendar/test'
  get 'calendar/index'
  get 'calendar/week'

  root 'page#index'

  get 'completed/:id' => 'surgery_appts#completed', as: 'completed'
  put 'completed2/:id' => 'surgery_appts#completed', as: 'completed_done'

#-------------------------------------------------
#Session Routes go here
  # resources :session, only: [:new, :create, :destroy]
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'session#new', as: 'login'
  post 'login' => 'session#create'
  # get 'session/new'
  get 'logout' => 'session#destroy', as: 'logout'
  #-------------------------------------------------


#--------------------------------------------------------
#Below untouched
  resources :users
  resources :inventories
  resources :actual_recipe_reqs
  resources :surgery_appts
  resources :surgery_recipe_reqs
  resources :surgery_types
  resources :clinics
  resources :supply_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#-----------------------------------------------------------------------------
#---------------CHRIS NOTES= THIS IS COPY PAST FROM MY SESSIONS "COPYCAT"---------------------------

# root 'page#index'
# resources :sessions, only: [:new, :create, :destroy]
#
# get 'signup' => 'users#new', as: 'signup'
# get 'login' => 'sessions#new', as: 'login'
# post 'login' => 'sessions#create'
#
# get 'logout' => 'sessions#destroy', as: 'logout'
#
# resources :users
# get 'page/index'
#-----------------------------------------------------------------------------
