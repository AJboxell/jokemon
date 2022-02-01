class BattlesController < ApplicationController

  def create
    @battle = Battle.new(battle_params)
    @battle.user = Pokemon.find(params[:battle][:user].to_i)
    @battle.adversary = Pokemon.find(params[:battle][:adversary].to_i)
    @battle.save
    redirect_to battle_path(@battle)
  end

  def show
    find_battle
  end

  def attack
    find_battle
    @adversary.hp -= @user.attack
    @adversary.save
    redirect_to battle_path(@battle) unless battle_over?
  end

  def battle_over?
    if @adversary.hp < 1 || @user.hp < 1
      @battle.destroy
      redirect_to pokemons_path
      @adversary.update!(hp: @adversary.max_hp)
      @user.update!(hp: @user.max_hp)
    end
  end

  private

  def find_battle
    @battle = Battle.find(params[:id])
    @user = @battle.user
    @adversary = @battle.adversary
  end

  def battle_params
    params.require(:battle).permit(:user_id, :adversary_id)
  end
end
