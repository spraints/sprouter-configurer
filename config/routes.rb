Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root :to => "home#dashboard"
  get ":addr", :to => "home#friend", :constraints => { :addr => /\d+\.\d+\.\d+\.\d+/ }

  put "connection_mode" => "home#set_mode"
  get "sprouter.conf" => "home#sprouter_config"
  get "stat" => "hacky#stat"
end
