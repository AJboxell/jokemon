class Pokemon < ApplicationRecord
  has_many :battles
  has_and_belongs_to_many :moves

  def fainted?
    hp < 1
  end

  def restore_health
    self.update!(hp: max_hp)
  end
end
