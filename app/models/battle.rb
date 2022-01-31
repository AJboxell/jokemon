class Battle < ApplicationRecord
  belongs_to :user, class_name: 'Pokemon'
  belongs_to :adversary, class_name: 'Pokemon'
end
