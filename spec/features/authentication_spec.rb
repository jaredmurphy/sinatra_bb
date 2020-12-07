# frozen_string_literal: true

require "spec_helper"

RSpec.feature "Authentication" do
  let!(:user) { create(:user, password: "password") }

  scenario "signing in with invalid credentials" do
    visit "/"
    click_link "Sign in"
    expect(page).to have_content("Sign in")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "invalid-password"
    click_button "Sign in"

    expect(page).to have_content("Your credentials are invalid")
  end

  scenario "signing in with the correct credentials" do
    visit "/"
    click_link "Sign in"
    expect(page).to have_content("Sign in")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "password"
    click_button "Sign in"

    expect(page).to have_content("Current User: #{user.email}")
  end

  scenario "signing out" do
    visit "/"
    click_link "Sign in"
    expect(page).to have_content("Sign in")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "password"
    click_button "Sign in"

    expect(page).to have_content("Current User: #{user.email}")

    click_button "Sign out"

    expect(page).to have_content("Brass Bull")
    expect(page).to have_content("Sign in")
  end
end
