# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Visting site pages" do
  it "when going to the homepage" do
    visit "/"

    expect(page).to have_content("Brass Bull")
  end
end
