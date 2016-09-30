Rails.application.routes.draw do
  get 'games/home'

  get 'games/new_match'

  get 'games/show_ranking'

  get 'games/edit'

  get 'games/destroy'

  post 'games/new_multiple_match'

  get 'games/new_challenge'

  post 'games/create_match'

  get 'games/:id/show_match_game', to: 'games#show_match_game', as: "show_match_game"

  post 'games/:id/save_results', to: 'games#save_results', as: "save_results"

  get 'games/show_winner/:id', to: 'games#show_winner', as: "show_winner"

  get 'games/:id/show_multiple_match_game', to: 'games#show_multiple_match_game', as: "show_multiple_match_game" 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to:"games#home"
devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

end
