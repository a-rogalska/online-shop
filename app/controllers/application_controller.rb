class ApplicationController < ActionController::Base
  before_action :set_basket

  private

  def set_basket
    @basket ||= Basket.new(session).session
  end
end
