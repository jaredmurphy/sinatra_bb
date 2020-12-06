# frozen_string_literal: true

class BrassBull < Sinatra::Base
  use PostsController
  use SessionsController
  use SiteController
end
