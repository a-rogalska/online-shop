class Basket
  class Total < Struct.new(:count, :total_price, :discount)
    def initialize(count, total_price, discount = 0)
      super(count, total_price, discount)
    end
  end
  attr_accessor :session

  def initialize(session)
    @session = session
    @session[:products] ||= {}
    @session[:total] ||= {}
  end
end