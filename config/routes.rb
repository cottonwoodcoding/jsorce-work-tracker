Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'home#index'
  get '/home', to: 'home#index'
  get '/work_logs', to: 'admin#work_logs'
  get '/add_work/:job_name', to: 'work_period#add_work'
  get '/new_job', to: 'job#new'
  get '/new_address/:job_name', to: 'address#new'
  get '/passed_work_periods', to: 'work_period#passed'
  get '/work_log/edit/:work_log_id', to: 'work_log#edit'
  get '/setup_appointments', to: 'admin#setup_appointments'
  get '/appointments/:user_id', to: 'appointment#index'
  get '/appointment/:appointment_id', to: 'appointment#show'
  get '/setup_appointment/:user_id', to: 'appointment#new'

  post '/start_work_period', to: 'work_period#start'
  post '/end_work_period', to: 'work_period#end'
  post '/create_job', to: 'job#create'
  post '/log_work', to: 'work_log#log_work'
  post '/create_address', to: 'address#create'
  post '/work_log/delete/:work_log_id', to: 'work_log#delete'
  post '/work_log/edit/:work_log_id', to: 'work_log#edit'
  post '/create_appointment', to: 'appointment#create'

  patch '/log_work', to: 'work_log#log_work'
end
