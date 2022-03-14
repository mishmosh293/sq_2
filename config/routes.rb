Rails.application.routes.draw do
  root :to => "sqs#index"
  resources :sq_types
  resources :sqs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
