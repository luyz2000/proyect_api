Rails.application.routes.draw do
  root 'visitor#index'

  get "activity_logs" => 'activity_logs#index', :defaults => { :format => 'html' }
  scope '/api', defaults: { :format => 'json'} do
    resources :activity_logs
    resources :activities
    resources :babies
    resources :assistants
    devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
    resource :user, only: [:show, :update]
  end

  get "activity_logs/:id" => 'activity_logs#show', :defaults => { :format => 'html' }
  get "api/babies/:id/activity_logs" => "babies#activity_logs", :defaults => { :format => 'json' }

end
