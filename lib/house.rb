class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def room_from_category(category)
    
  end

  def above_market_average?
    @price >= 500000
  end

  def add_room(room_number)
    @rooms << room_number
  end
end
