# frozen_string_literal: true

require "spec_helper"

RSpec.feature "Visiting post pages" do
  let!(:user) { create(:user, password: "password") }

  scenario "when going to the posts page" do
    visit "/archives"
  end

  scenario "visiting the new posts page with invalid credentials" do
    visit "/posts/new"
    expect(page).to have_content("Not authorized")
  end

  scenario "visiting the new posts page with the correct credentials" do
    visit "/"
    visit "/sign_in"
    expect(page).to have_content("Sign in")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "password"
    click_button "Sign in"
    expect(page).to have_content("Current User: #{user.email}")

    visit "/posts/new"
    expect(page).to have_content("Create new post")

    fill_in "post[title]", with: "My New Post"
    fill_in "post[body]",  with: "here is a long body with many paragaphs"
    click_button "Submit"
    expect(page).to have_content("My New Post")
    expect(page).to have_current_path("/posts/my-new-post")
  end

  let!(:post) { create(:post) }

  scenario "visiting the posts edit page with invalid credentials" do
    visit "/posts/#{post.slug}/edit"
    expect(page).to have_content("Not authorized")
  end

  scenario "visiting the new posts page with the correct credentials" do
    visit "/"
    visit "/sign_in"
    expect(page).to have_content("Sign in")

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "password"
    click_button "Sign in"
    expect(page).to have_content("Current User: #{user.email}")

    visit "/posts/#{post.slug}/edit"
    expect(page).to have_content("Edit Post")

    fill_in "post[title]", with: "My editted post"
    click_button "Submit"
    expect(page).to have_content("My editted post")
    expect(page).to have_current_path("/posts/#{post.slug}")
  end
end
