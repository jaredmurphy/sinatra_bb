# frozen_string_literal: true

require "spec_helper"

RSpec.feature "Authentication" do
  let!(:user) { create(:user, password: "password") }

  scenario "signing in with invalid credentials" do
    visit "/sign_in"
    expect(page).to have_content("Sign in")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "invalid-password"
    click_button "Sign in"

    expect(page).to have_content("Your credentials are invalid")
  end

  scenario "signing in with the correct credentials" do
    visit "/"
    visit "/sign_in"
    expect(page).to have_content("Sign in")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "password"
    click_button "Sign in"

    expect(page).to have_content("Welcome, #{user.name}")
  end

  scenario "signing out", :js do
    visit "/"
    visit "/sign_in"
    expect(page).to have_content("Sign in")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "password"
    click_button "Sign in"

    expect(page).to have_content("Welcome, #{user.name}")

    click_link "Sign out"

    expect(page).to have_content("Brass Bull")
    expect(page).to_not have_content("Welcome, #{user.name}")
  end
end
