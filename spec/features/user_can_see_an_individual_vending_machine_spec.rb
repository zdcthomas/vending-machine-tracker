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
    snack1 = dons.snacks.create!(name:'White Castle Burger', price:350)
    snack1 = dons.snacks.create!(name:'Pop Rocks', price:150)
    snack1 = dons.snacks.create!(name:'Flaming Hot Cheetos', price:250)

    visit machine_path(dons)

    expect(page).to have_content("White Castle Burger: $3.50")
    expect(page).to have_content('Pop Rocks: $1.50')
    expect(page).to have_content('Flaming Hot Cheetos: $2.50')
  end
  it 'should show the average price of the items in the vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create!(name:'White Castle Burger', price:350)
    snack1 = dons.snacks.create!(name:'Pop Rocks', price:150)
    snack1 = dons.snacks.create!(name:'Flaming Hot Cheetos', price:250)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $2.50")
  end
end
