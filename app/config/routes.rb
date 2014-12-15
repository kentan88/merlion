Application.router.draw do
  get "/", :to => "welcome#index"
  get "/items", :to => "items#index"
  get "/items/new", :to => "items#new"
  get "/items/create", :to => "items#create"
  get /.*/, :to => "custom#show"
end
