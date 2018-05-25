class Snack < ApplicationRecord
  has_many :machine_snacks, class_name: MachineSnacks
  has_many :machines, through: :machine_snacks
  def price_in_dollars
    "$#{self.price.to_f/100.round(2)}"
  end
end
