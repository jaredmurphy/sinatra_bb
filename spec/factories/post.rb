# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    body  { Faker::Markdown.sandwich }
    slug  { Faker::Internet.slug }
    user  { create(:user) }
  end
end
