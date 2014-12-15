Application.router.draw do
  get "/items", :to => "items#index"
  get "/items/new", :to => "items#new"
  get "/burp", :to => "welcome#index"
  get /.*/, :to => "custom#show"
end
