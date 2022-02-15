class BattlesController < ApplicationController
  before_action :find_battle, except: :create
  before_action :find_move, only: [:attack, :accurate?]

  def create
    @battle = Battle.new(battle_params)
    @battle.turn = 0
    @battle.user = Pokemon.find_by(name: params[:battle][:user])
    @battle.adversary = Pokemon.find_by(name: params[:battle][:adversary])
    @battle.save
    redirect_to battle_path(@battle)
  end

  def show; end

  def attack
    @battle.turn += 1
    if accurate?
      @defender.hp -= @attacker.attack * @move.power
      @defender.status = @move.status unless @move.status.nil?
      @defender.save
      @battle.update!(message: "#{@attacker.name} used #{@move.name}!")
    else
      sleep 1
      @battle.update!(message: "#{@attacker.name} missed!")
    end
    status_checks
    battle_over?
  end

  def battle_over?
    if @defender.fainted?
      if @defender == @adversary
        @winner, @loser, message = @user, @adversary, "#{@adversary.name} has fainted, you win!"
      else
        @winner, @loser, message = @adversary, @user, "Ouch, you lose..."
      end
      @loser.hp = 0
      @battle.update!(message: message)
      render 'battle_over'
    else
      redirect_to battle_path(@battle)
    end
  end

  def destroy
    @battle.destroy
    @adversary.restore_health
    @user.restore_health
    redirect_to pokemons_path
  end

  private

  def accurate?
    rand(1..100) < (100 - (@defender.evasion ** 2))
  end

  def status_checks
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
