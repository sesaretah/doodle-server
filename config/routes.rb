Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_version(:module => "V1", :path => {:value => "v1"}) do

    get '/actuals/delete', to: 'actuals#delete'

    resources :profiles
    resources :courses
    resources :sections
    resources :discussions
    resources :comments

    post '/users/login', to: 'users#login'
    post '/users/sign_up', to: 'users#sign_up'

  end
end
