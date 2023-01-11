require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'displays repo name, users, total commits, and merged pull request from API call' do
    visit '/'

    expect(page).to have_content("Git Repo Name: ")
    expect(page).to have_content("MatisseMallette Total Commits: ")
    expect(page).to have_content("KelsiePorter Total Commits: ")
    expect(page).to have_content("banosl Total Commits: ")
    expect(page).to have_content("anhtran811 Total Commits: ")
    expect(page).to have_content("Total Merged Pull Requests: ")

    visit '/admin'

    expect(page).to have_content("Git Repo Name: ")
    expect(page).to have_content("MatisseMallette Total Commits: ")
    expect(page).to have_content("KelsiePorter Total Commits: ")
    expect(page).to have_content("banosl Total Commits: ")
    expect(page).to have_content("anhtran811 Total Commits: ")
    expect(page).to have_content("Total Merged Pull Requests: ")
  end
end