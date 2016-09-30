require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  render_views
  describe "public methods" do

    context "GET show_ranking" do
      before do
        @user = FactoryGirl.build(:user)
        sign_in @user
        get :show_ranking
        @users=User.all
      end

      it "must assign all users to @users" do
          expect(assigns(:users)).to match_array(@users)
      end
      #response espera respuesta, siempre usar en renders de vistas
      it "must render the show ranking view" do
        expect(response).to render_template("show_ranking")
      end
    end
  end




end
