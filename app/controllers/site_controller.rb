# frozen_string_literal: true

class SiteController < ApplicationController
  get "/" do
    @name = "Emrys"
    erb :welcome
  end
end
