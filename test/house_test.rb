require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'
class HouseTest < Minitest::Test
  def test_it_exists_and_has_attributes
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
    assert_equal 400000, house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_it_can_have_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    assert_equal [], house.rooms

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
  end

  def test_above_market_average
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    assert_equal false, house.above_market_average?

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_4], house.rooms_from_category(:basement)
    assert_equal 1900, house.area

    expected = {"price" => 400000, "address" => "123 sugar lane"}

    assert_equal expected, house.details
  end

  def test_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)

    assert_equal 210.53, house.price_per_square_foot
    assert_equal [room_4, room_3, room_2, room_1], house.rooms_sorted_by_area
    
    expected = {:bedroom=>[room_1, room_2], :living_room=> [room_3], :basement=> [room_4]}

    assert_equal expected, house.rooms_by_category
  end
end
