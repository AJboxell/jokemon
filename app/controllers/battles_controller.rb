class BattlesController < ApplicationController
  before_action :find_battle, except: :create
  before_action :find_move, only: [:attack, :accurate?, :power, :elements, :add_status]

  def create
    @battle = Battle.new(battle_params)
    @battle.turn = 0
    @battle.user = Pokemon.find_by(name: params[:battle][:user])
    @battle.adversary = Pokemon.find_by(name: params[:battle][:adversary])
    @battle.user.status = []
    @battle.user.save
    @battle.adversary.status = []
    @battle.adversary.save
    @battle.save
    redirect_to battle_path(@battle)
  end

  def show; end

  def attack
    @battle.turn += 1
    status_checks if @attacker.status?
    @battle.update!(message: "#{@attacker.name} used #{@move.name}!")
    if accurate?
      @defender.hp -= power
      if @move.status?
        add_status
      elsif elements == 2
        @battle.update!(result: "It was super effective!")
      elsif elements == 0.5
        @battle.update!(result: "It wasn't very effective...")
      else
        @battle.update!(result: "")
      end
      @defender.save
    else
      @battle.update!(result: "#{@attacker.name} missed!")
    end
    redirect_to battle_path(@battle) unless battle_over?
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
    rand(1..100) < (100 - (@defender.evasion ** 2 / 2) * (@move.accuracy / 4))
  end

  def power
    @attacker.attack * @move.power * elements
  end

  def elements
    elements = {
      "fire" => { strong: ["grass", "ice"], weak: ["water", "ground", "rock"] },
      "water" => { strong: ["fire", "ground"], weak: ["grass"] },
      "grass" => { strong: ["water", "rock"], weak: ["fire"] }
    }
    if elements.has_key?(@move.element)
      if elements[@move.element][:strong].include?(@defender.element)
        return 2
      elsif elements[@move.element][:weak].include?(@defender.element)
        return 0.5
      else
        return 1
      end
    else
      return 1
    end
  end

  def add_status
    cumulative = ["defence-", "defence--", "attack-", "accuracy-"]
    if cumulative.include?(@move.status)
      @defender.status << @move.status
      message = "#{@defender.name}'s #{@move.status.gsub("-", "")} fell"
    else
      if @defender.status.include?(@move.status)
        message = "It had no effect!"
      else
        @defender.status << @move.status
        message = "#{@defender.name} was #{@move.status}ed!"
      end
    end
    @battle.update!(result: message)
  end

  def status_checks
    if @attacker.status.include?("poison")
      @attacker.hp -= 1
      @attacker.save
      @battle.update!(result: "#{@attacker.name} was hurt by the poison!")
    end
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
