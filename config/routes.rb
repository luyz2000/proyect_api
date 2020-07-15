Rails.application.routes.draw do
  root 'visitor#index'

  scope '/api' do
    resources :activity_logs
    resources :activities
    resources :babies
    resources :assistants
    #, only: :index
  end

  get "activity_logs" => 'visitor#activity_logs'
  get "api/babies/:id/activity_logs" => "babies#activity_logs"
end
