# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Visiting post pages" do
  before do
    User.create(email: "test@test.com", name: "test user")
  end

  it "when going to the posts page" do
    visit "/posts"

    expect(page).to have_content("Posts")
    expect(page).to have_content("Users: 1")
  end
end
