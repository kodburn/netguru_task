Rails.application.routes.draw do
  devise_for :users
  resources  :teachers
  resources  :students do
    get :subjects
  end
  get "reports/subjects"
  get "visitors/index"
end
