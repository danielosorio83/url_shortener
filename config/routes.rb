# == Route Map
#
# Prefix Verb URI Pattern     Controller#Action
#   urls POST /urls(.:format) urls#create
#   root GET  /               root#index
#

Rails.application.routes.draw do
  post '/urls', to: 'urls#create'
  root 'root#index'
end
