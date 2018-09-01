Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rols do #do añade varios recursos a el
    resources :skills, shallow: true
  end
  get 'skills', to: 'skills#getall' #primera forma de llamar el listado de skills
  get 'skills/:id/rols', to: 'skills#getall' #segunda forma de llamar el listado de skills
  post 'skills/:id/rols', to: 'skills#createrol'
  #resources :skills do
  #  resources :rols, shallow: true
  #end
end