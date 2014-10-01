Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  root 'home#index'
  get '/work_logs', to: 'work_logs#admin'
  get '/add_work', to: 'work_week#add_work'

  post '/start_work_week', to: 'work_week#start'
  post '/end_work_week', to: 'work_week#end'
  post '/log_work', to: 'work_logs#log_work'
end
