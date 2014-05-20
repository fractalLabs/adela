Adela::Application.routes.draw do
  devise_for :users

  get "/:slug/catalogo" => "organizations#catalog", :as => "organization_catalog"
  resources :users, only: :show
  root :to => "home#index"

  resources :organizations, only: :show do
    member do
      post "publish_catalog"
      get "publish_later"
    end
  end
  resources :inventories do
    collection do
      get "publish"
    end
  end

  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do

      get "/catalogs" => "organizations#catalogs"

      resources :organizations do
        collection do
          get "catalogs"
        end
      end
    end
  end
end