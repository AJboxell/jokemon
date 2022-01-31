class BattlesController < ApplicationController

  def create
    @battle = Battle.new(battle_params)
    @battle.user = Pokemon.find(params[:battle][:user].to_i)
    @battle.adversary = Pokemon.find(params[:battle][:adversary].to_i)
    @battle.save
    redirect_to battle_path(@battle)
  end

  def show
    @battle = Battle.find(params[:id])
  end

  private

  def battle_params
    params.require(:battle).permit(:user_id, :adversary_id)
  end
end
