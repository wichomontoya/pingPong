class GamesController < ApplicationController
    before_action :authenticate_user!, :except => :home


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
    @winner
    access_players
    if @game.game_type == "single_match"
      @game.score_player=params[:results_player].to_i
      @game.score_opponent=params[:results_opponent].to_i
      @game.save
      @winner = params[:winner]
      if @winner === "player"
        @player.score = 0
        @player.score = @player.score + 1
        @player.save
      elsif @winner === "opponent"
        @opponent.score = 0
        @opponent.score = @opponent.score + 1
        @opponent.save
      else
        redirect_to new_match_path
      end
    elsif @game.game_type == "multiple_match"
      @winner = [params[:winner1], params[:winner2], params[:winner3]]
      counter = 0
      @winner.each do |w|
        if w === "player"
          counter += 1
        elsif w === "opponent"
          counter = counter - 1
        end
      end
      if counter > 0
        @player.score = 0
        @player.score += 3
        @player.save
      else 
        @opponent.score = 0
        @opponent.score += 3
        @opponent.save
      end
    end
    redirect_to games_show_ranking_path
  end

  def show_ranking
    @players=User.all
    @players=@players.sort_by(&:score).reverse
  end

  def new_challenge
    call_players
  end

  def edit
  end

  def destroy
  end

  def see_my_games
    @games=Game.where("player_id = #{current_user.id} OR opponent_id = #{current_user.id}")
    @games=@games.sort_by(&:created_at).reverse
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
