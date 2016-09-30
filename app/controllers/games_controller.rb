class GamesController < ApplicationController
    before_action :authenticate_user!

  def new_match
    call_players
  end
  #Revisar bien los parametros que llegan del formulario, ya que no guarda el id del oponente
  def create_match
    @match=Game.new(:player_id => current_user.id, :opponent_id => params[:opponent])
    binding pry
    @match.save
    redirect_to "/games/:id/match"
  end

  def show_ranking
    @players=User.all
  end

  def home
  end

  def new_multiple_match
    call_players
    redirect_to '/games/new_match'
  end

  def new_challenge
    call_players
  end

  def edit
  end

  def destroy
  end
end

private

def call_players
  @player= current_user
  @opponents= User.where.not(:id => current_user.id)
end
