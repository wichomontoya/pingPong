Rails.application.routes.draw do
  get 'games/home'

  get 'games/new'

  get 'games/edit'

  get 'games/destroy'

  get 'games/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to:"games#home"
devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

end
