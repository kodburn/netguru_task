Rails.application.routes.draw do
  devise_for :users
  resources  :teachers
  resources  :students do
    get :subjects
  end
  get 'reports/subjects', as: 'report_subjects'
  get 'visitors/index'
  root 'visitors#index'
end
