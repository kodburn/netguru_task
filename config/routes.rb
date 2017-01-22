Rails.application.routes.draw do
  devise_for :users
  resources  :teachers do 
  	get :subjects
  end
  resources  :students do
    get :subjects
  end
  get 'reports/subjects', as: 'report_subjects'
  get 'visitors/index'
  root 'visitors#index'
end
