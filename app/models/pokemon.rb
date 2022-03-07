class Pokemon < ApplicationRecord
  has_many :battles
  has_and_belongs_to_many :moves
  has_many :decision_matrices

  def fainted?
    hp < 1
  end

  def restore_health
    self.update!(hp: max_hp, status: nil)
  end
end
