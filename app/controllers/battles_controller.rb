class BattlesController < ApplicationController
  before_action :find_battle, only: [:show, :attack, :accurate?, :find_move, :battle_over]
  before_action :find_move, only: [:attack, :accurate?]

  def create
    @battle = Battle.new(battle_params)
    @battle.user = Pokemon.find_by(name: params[:battle][:user])
    @battle.adversary = Pokemon.find_by(name: params[:battle][:adversary])
    @battle.save
    redirect_to battle_path(@battle)
  end

  def show; end

  def attack
    if accurate?
      @defender.hp -= @attacker.attack * @move.power
      @defender.save
      @battle.update!(message: "#{@attacker.name} used #{@move.name}!")
    else
      @battle.update!(message: "#{@attacker.name} missed!")
    end
    battle_over?
  end

  def battle_over?
    if @defender.fainted? || @attacker.fainted?
      sleep 2
      message = @defender.fainted? ? "#{@defender} has fainted, you win!" : "Ouch, you lose..."
      @battle.update!(message: message)
      @battle.destroy
      redirect_to pokemons_path
      @adversary.restore_health
      @user.restore_health
    else
      redirect_to battle_path(@battle)
    end
  end

  private

  def accurate?
    rand(1..100) < (100 - (@defender.evasion ** 2))
  end

  def find_battle
    @battle = Battle.find(params[:id])
    @user = @battle.user
    @adversary = @battle.adversary
  end

  def find_move
    @attacker = Pokemon.find(params[:attacker])
    @defender = Pokemon.find(params[:defender])
    @move = Move.find(params[:move].to_i)
  end

  def battle_params
    params.require(:battle).permit(:user_id, :adversary_id)
  end
end
