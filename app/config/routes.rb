Application.router.draw do
  # get "/",              :to => "welcome#index"
  # get "/articles",         :to => "articles#index"
  get "/articles/new",     :to => "articles#new"
  post "/articles/create", :to => "articles#create"
  # get /.*/,             :to => "application#index"
end
