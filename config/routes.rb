Rails.application.routes.draw do
  get '/' => "items#index"
  get "/items/select" => "items#select"
  get "/items/expenditure" => "items#expenditure"
  get "/items/income" => "items#income"

  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
