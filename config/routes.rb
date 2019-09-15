Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: "static_pages#home"
  end

  get '/choose_subject', to: "static_pages#choose_subject"
  resources :course_memberships, only: [:create]
  resources :courses, only: [:show]
  resources :notes, only: [:show, :create]
  resources :mock_exams, only: [:new, :create, :show] do
    post 'submit', on: :member
  end
end
