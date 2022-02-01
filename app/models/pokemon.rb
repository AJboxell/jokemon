class Pokemon < ApplicationRecord
  has_many :battles

  def alive?
    hp > 0
  end
end
