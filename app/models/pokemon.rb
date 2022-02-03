class Pokemon < ApplicationRecord
  has_many :battles
  has_and_belongs_to_many :moves

  def alive?
    hp > 0
  end
end
