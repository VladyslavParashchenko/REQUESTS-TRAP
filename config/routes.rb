Rails.application.routes.draw do
  get 'main/index'
  get '/instructions' => 'main#show_instructions'
  get '/:trap_id/requests' => 'main#show_requests'
  match '/:trap_id(/*other)', to: 'main#save_request', via: :all
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
