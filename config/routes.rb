Rails.application.routes.draw do
  namespace :api
    namespace :v1
      resources sessions, only: :create
      resources users, only: :create
    end
  end 
end
