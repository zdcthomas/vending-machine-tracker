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
  end
end