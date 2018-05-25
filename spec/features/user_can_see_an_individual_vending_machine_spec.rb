require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it 'should show the name of all of the snacks associated with that vending machine along with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create!(name:'White Castle Burger', price:350)
    snack2 = Snack.create!(name:'Pop Rocks', price:150)
    snack3 = Snack.create!(name:'Flaming Hot Cheetos', price:250)
    
    MachineSnacks.create!(machine_id:dons.id, snack_id:snack1.id)
    MachineSnacks.create!(machine_id:dons.id, snack_id:snack2.id)
    MachineSnacks.create!(machine_id:dons.id, snack_id:snack3.id)

    visit machine_path(dons)

    expect(page).to have_content("White Castle Burger: $3.5")
    expect(page).to have_content('Pop Rocks: $1.5')
    expect(page).to have_content('Flaming Hot Cheetos: $2.5')
  end
  it 'should show the average price of the items in the vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create!(name:'White Castle Burger', price:350)
    snack2 = Snack.create!(name:'Pop Rocks', price:150)
    snack3 = Snack.create!(name:'Flaming Hot Cheetos', price:250)
    
    MachineSnacks.create!(machine_id:dons.id, snack_id:snack1.id)
    MachineSnacks.create!(machine_id:dons.id, snack_id:snack2.id)
    MachineSnacks.create!(machine_id:dons.id, snack_id:snack3.id)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $2.5")
  end
end
