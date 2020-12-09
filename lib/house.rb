class House
  attr_reader :price, :address, :rooms, :details

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
    @details = Hash.new
  end

  def rooms_by_category
    @rooms.group_by do |room|
      room.category
    end
  end

  def details
    @details["price"] = @price
    @details["address"] = @address
    @details
  end

  def rooms_sorted_by_area
    rooms_sorted = rooms.sort_by do |room|
      room.area
    end
    rooms_sorted.reverse
  end

  def price_per_square_foot
    (price / area.to_f).round(2)
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
