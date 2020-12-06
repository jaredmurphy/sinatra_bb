# frozen_string_literal: true

require "spec_helper"

RSpec.feature "Visiting post pages" do
  let!(:user) { create(:user, password: "password") }

  scenario "when going to the posts page" do
    visit "/posts"

    expect(page).to have_content("Posts")
    expect(page).to have_content("Users: 1")
  end

  scenario "visiting the new posts page with invalid credentials" do
    visit "/posts/new"
    expect(page).to have_content("Not authorized")
  end

  scenario "visiting the new posts page with the correct credentials" do
    visit "/"
    click_link "Sign in"
    expect(page).to have_content("Sign in")

    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_button "Sign in"
    expect(page).to have_content("Current User: #{user.email}")

    visit "/posts/new"
    expect(page).to have_content("Create new post")

    fill_in "title", with: "My New Post"
    fill_in "body",  with: "here is a long body with many paragaphs"
    click_button "Submit"
    expect(page).to have_content("My New Post")
    expect(page).to have_current_path("/posts/my-new-post")
  end
end
