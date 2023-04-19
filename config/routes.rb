Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace "api" do
    scope path: "auth" do
      post "signin", to: "auth#signin"
      post "signup", to: "auth#signup"
    end
    get "test", to: "test#index"
  end
end
