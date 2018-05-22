Rails.application.routes.draw do
  get 'main/index'
  get '/instructions' => 'main#show_instructions'
  get '/:trap_id/requests' => 'main#show_requests'
  get '/:trap_id(/*other)' => 'main#save_request'
  post '/:trap_id(/*other)' => 'main#save_request'
  put '/:trap_id(/*other)' => 'main#save_request'
  delete '/:trap_id(/*other)' => 'main#save_request'
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
