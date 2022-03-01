class DecisionMatrix < ApplicationRecord
  # belongs_to :battle
  serialize :one, Hash
  serialize :two, Hash
  serialize :three, Hash
  serialize :four, Hash

  def total
    self.one[:weighting] + self.two[:weighting] + self.three[:weighting] + self.four[:weighting]
  end

  def select
    roll = rand(1..self.total)
    if roll <= self.two[:weighting]
      @move = Move.find_by(name: self.one[:name])
    elsif roll > self.two[:weighting] && roll <= self.three[:weighting]
      @move = Move.find_by(name: self.two[:name])
    elsif roll > self.three[:weighting] && roll <= self.four[:weighting]
      @move = Move.find_by(name: self.three[:name])
    else
      @move = Move.find_by(name: self.four[:name])
    end
    @move
  end
end
