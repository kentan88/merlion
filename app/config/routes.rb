Application.router.draw do
  get "/", :to => "welcome#index"
  get "/items", :to => "items#index"
  get "/items/new", :to => "items#new"
  get /.*/, :to => "custom#show"
end
