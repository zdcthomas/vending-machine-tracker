require 'rails_helper'

feature 'When a user visits a snack show page' do
  it 'should display the name of that snack' do
    snack = Snack.create!(name:"milky way", price:250)

    visit snack_path(snack)
    expect(page).to have_content(snack.name)
  end
  it 'should display the price of that snack' do
    snack = Snack.create!(name:"milky way", price:250)

    visit snack_path(snack)
    expect(page).to have_content(snack.price)
  end
  it 'should display the locations of vending machines which carry that snack with average prices and counts of items' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    jims  = owner.machines.create(location: "Jims's Mixed Drinks")
    snack1 = Snack.create!(name:'White Castle Burger', price:350)
    MachineSnacks.create!(machine_id:dons.id, snack_id:snack1.id)
    MachineSnacks.create!(machine_id:jims.id, snack_id:snack1.id)

    visit snack_path(snack1)
    
    expect(page).to have_content(dons.location)
    expect(page).to have_content(jims.location)
    expect(page).to have_content("Average Price: $3.5")
    expect(page).to have_content("#{dons.location}: 1")
    expect(page).to have_content("#{jims.location}: 1")
  end
end