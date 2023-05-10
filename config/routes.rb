Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace "api" do
    scope path: "auth" do
      post "signin", to: "auth#signin"
      post "signup", to: "auth#signup"
    end

    scope module: "user" do
      resources :comics, only: [:index, :show]
      resources :chapters, only: [:index, :show]
    end

    namespace "admin" do
    end
  end
end
