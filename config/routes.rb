Rails.application.routes.draw do
  root 'visitor#index'

  get "activity_logs" => 'activity_logs#index', :defaults => { :format => 'html' }
  scope '/api' do
    resources :activity_logs, :defaults => { :format => 'json'}
    resources :activities, :defaults => { :format => 'json' }
    resources :babies, :defaults => { :format => 'json' }
    resources :assistants, :defaults => { :format => 'json' }
  end

  get "activity_logs/:id" => 'activity_logs#show', :defaults => { :format => 'html' }
  get "api/babies/:id/activity_logs" => "babies#activity_logs", :defaults => { :format => 'json' }
  
end
