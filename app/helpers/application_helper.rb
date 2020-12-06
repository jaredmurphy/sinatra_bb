# frozen_string_literal: true

class ApplicationHelper
  def current_user
    @current_user = User.find_by(id: session[:id])
  end
end
