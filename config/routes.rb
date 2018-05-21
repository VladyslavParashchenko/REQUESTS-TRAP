Rails.application.routes.draw do
  get 'main/index'
  get '/instructions' => 'main#show_instructions'
  get '/:trap_id' => 'main#save_request'
  post '/:trap_id' => 'main#save_request'
  get 'main/show_requests'
  get '/:trap_id/requests' => 'main#show_requests'
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
