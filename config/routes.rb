Rails.application.routes.draw do
  get 'enrollments/index'
  get 'enrollments/new'
    root 'courses#index'

    resources :users
    resources :courses do
      resources :enrollments, only: [:index, :new, :create, :destroy]
  end
end