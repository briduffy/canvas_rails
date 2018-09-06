Rails.application.routes.draw do
    #localhost:3000
    root 'course#index'

    resources :users
    resources :courses
end