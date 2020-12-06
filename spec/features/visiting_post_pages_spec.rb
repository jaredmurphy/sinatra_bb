# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Visiting post pages" do
  before { create(:user) }

  it "when going to the posts page" do
    visit "/posts"

    expect(page).to have_content("Posts")
    expect(page).to have_content("Users: 1")
  end
end
