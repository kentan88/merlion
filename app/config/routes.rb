Application.router.draw do
  get "/articles",         to: "articles#index"
  get "/articles/:id",     to: "articles#show"
  get "/articles/new",     to: "articles#new"
  post "/articles/create", to: "articles#create"
end
