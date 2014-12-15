Application.router.draw do
  get "/", :to => "welcome#index"
  get "/burp", :to => "welcome#index"
  get /.*/, :to => "custom#show"
end
