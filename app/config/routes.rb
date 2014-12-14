Application.router.draw do
  get "/welcome", :to => "welcome#index"
  get /.*/, :to => "custom#show"
end
