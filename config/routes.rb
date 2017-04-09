Rails.application.routes.draw do
  resources :welcomes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcomes#index'

  namespace :api do
    namespace :v1 do
      resources :welcomes do
        resources :header1s
        resources :header2s
        resources :header3s
        resources :link_urls

        # get 'new/:url', to: 'new'
        post '/:new_url' => 'welcome#create'
      end
    end
  end
end
