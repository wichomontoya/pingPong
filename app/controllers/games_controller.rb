class GamesController < ApplicationController
    before_action :authenticate_user!


  def home
  end

  def new_match
    call_players
  end

  def create_match
    @match=Game.new
    @match.player = current_user
    @match.opponent = User.find(params[:opponent])
    @match.game_type = params[:type]
    @match.save
    if @match.game_type === "single_match"
      redirect_to show_match_game_path(@match.id)
    elsif @match.game_type === "multiple_match"
      redirect_to show_multiple_match_game_path(@match.id)
    end
  end

  def show_match_game
    access_players
  end

  def show_multiple_match_game
    access_players
  end

  def save_results
    binding.pry
    @winner
    game=Game.find(params[:id])
    player=User.find(game.player_id)
    opponent=User.find(game.opponent_id)
    if game.game_type == "single_match"
      game.score_player=params[:results_player].to_i
      game.score_opponent=params[:results_opponent].to_i
      game.save
    end
    
    redirect_to games_show_ranking_path
  end

  def show_winner
    @winner=User.find(params[:id])
  end

  def show_ranking
    @players=User.all
  end

  def new_challenge
    call_players
  end

  def edit
  end

  def destroy
  end


private

  def call_players
    @player= current_user
    @opponents= User.where.not(:id => current_user.id)
  end

  def access_players
    @game=Game.find(params[:id])
    @player=User.find(@game.player_id)
    @opponent=User.find(@game.opponent_id)
  end

end
