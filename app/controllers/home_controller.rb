class HomeController < ApplicationController
  def index
    if user_signed_in?
      render template: "home/signed_in_index"
    end
  end
end
