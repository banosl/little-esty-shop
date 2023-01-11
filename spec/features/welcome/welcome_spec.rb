require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'displays a welcome page' do
    visit '/'

    expect(page).to have_content("Welcome to Little Esty Shop")
    expect(page).to have_content("Collaborators")
    expect(page).to have_content("Leo Banos Garcia")
    expect(page).to have_content("Matisse Mallette")
    expect(page).to have_content("Kelsie Porter")
    expect(page).to have_content("Anhnhi Tran")
  end

  it 'displays total commits from API call' do
    visit '/'

    expect(page).to have_content("Total Commits: ")
  end
end