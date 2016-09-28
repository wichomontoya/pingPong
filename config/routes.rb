Rails.application.routes.draw do
  get 'games/home'

  get 'games/new_match'

  get 'games/show_ranking'

  get 'games/edit'

  get 'games/destroy'

  post 'games/new_multiple_match'

  get 'games/new_challenge'

  get 'games/new_game'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to:"games#home"
devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

end
