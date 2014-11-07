Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root 'home#index', as: :index
  get '/home', to: 'home#index'
  get '/work_logs', to: 'admin#work_logs'
  get '/add_work/:job_name', to: 'work_period#add_work'
  get '/new_job', to: 'job#new'
  get '/new_address/:job_id', to: 'address#new'
  get '/passed_work_periods', to: 'work_period#passed'
  get '/work_log/edit/:work_log_id', to: 'work_log#edit'
  get '/setup_appointments', to: 'admin#setup_appointments'
  get '/appointments/:user_id', to: 'appointment#index'
  get '/appointment/:appointment_id', to: 'appointment#show'
  get '/setup_appointment/:user_id', to: 'appointment#new'
  get '/edit_appointment/:appointment_id', to: 'appointment#edit'
  get '/edit_open_appointment/:appointment_id', to: 'open_appointment#edit'
  get '/setup_open_appointment', to: 'open_appointment#new'
  get '/open_appointment/:appointment_id', to: 'open_appointment#show'

  post '/start_work_period', to: 'work_period#start'
  post '/end_work_period', to: 'work_period#end'
  post '/create_job', to: 'job#create'
  post '/log_work', to: 'work_log#log_work'
  post '/create_address', to: 'address#create'
  post '/work_log/delete/:work_log_id', to: 'work_log#delete'
  post '/work_log/edit/:work_log_id', to: 'work_log#edit'
  post '/create_appointment', to: 'appointment#create'
  post '/create_open_appointment', to: 'open_appointment#create'

  delete '/delete_open_appointment/:appointment_id', to: 'open_appointment#delete', as: :delete_open_appointment
  delete '/delete_appointment/:appointment_id', to: 'appointment#delete', as: :delete_appointment

  patch '/log_work', to: 'work_log#log_work'
  patch '/update_appointment/:appointment_id', to: 'appointment#update'
  patch '/update_open_appointment/:appointment_id', to: 'open_appointment#update'
  patch '/claim_appointment/:appointment_id', to: 'open_appointment#claim'
end
