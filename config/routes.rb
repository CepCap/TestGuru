Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
              controllers: { sessions: "sessions" }

  root 'tests#index'

  resources :feedbacks, only: %i[new create] do
    member do
      get :new
      post :create
    end
  end

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: :true, except: :index do
        resources :answers, shallow: :true, except: :index
      end
    end

    resources :gists, only: [:index]
  end

end
