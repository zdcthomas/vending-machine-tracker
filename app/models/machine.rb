class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks, class_name: MachineSnacks
  has_many :snacks, through: :machine_snacks

  def average_price
    avg = self.snacks.average(:price)
    "#{avg.to_f/100.round(2)}"
  end
end
