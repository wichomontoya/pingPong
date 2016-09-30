require 'rails_helper'

RSpec.describe User, type: :model do
  #para quien hacemos la prueba
  describe :user do
    #contexto de las pruebas
    context "validations" do
        #preparando el terreno, lo que necesitamos antes para hacer la pruebas
        before do
          @user = FactoryGirl.build(:user)
        end
        it "must have a valid email" do
          expect(@user).to allow_value(Faker::Internet.email).for(:email)
          expect(@user.email).not_to be_empty
          expect(@user.email).not_to be_nil
          expect(@user).not_to allow_value("okemail@com").for(:email)
        end

        it "must have a first name" do
          expect(@user).to 
        end
    end
  end
end
