class House
  attr_reader :price, :address, :rooms, :details
  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
    @details = Hash.new(0)
  end

  def details
    @details["price"] = @price
    @details["address"] = @address
    @details
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end

  def above_market_average?
    @price >= 500000
  end

  def add_room(room_number)
    @rooms << room_number
  end
end
