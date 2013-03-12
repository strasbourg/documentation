SxbDataMissingApi::Application.routes.draw do
  scope module: :api, as: :api, subdomain: :api do
    namespace :parkings do
      scope module: :v1, format: :json do
        resources :parkings
      end
    end
    scope module: :cts, as: :cts, subdomain: :cts do
      scope module: :v1, format: :json do
        resources :stops, only: [:index, :show] do
          resources :arrivals
        end
      end
    end
  end

  scope module: :documentation, as: :documentation do
    root to: 'documentation#show', id: 'homepage'
    get '*id', to: 'documentation#show', as: :page
  end
end
