# frozen_string_literal: true

class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :slug,  presence: true, uniqueness: true
  validates :body,  presence: true
end
