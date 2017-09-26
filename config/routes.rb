# == Route Map
#
# Prefix Verb URI Pattern      Controller#Action
#   urls POST /urls(.:format)  urls#create
#   root GET  /                root#index
#   code GET  /:code(.:format) urls#show
# 

Rails.application.routes.draw do
  post '/urls', to: 'urls#create'
  root 'root#index'
  get '/:code', to: 'urls#show', as: :code
end
