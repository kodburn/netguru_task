Rails.application.routes.draw do
  resources :students do
    get :subjects
  end
end
