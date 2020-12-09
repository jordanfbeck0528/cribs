class Room
  attr_reader :category

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @is_painted = false
  end

  def paint
    @is_painted = true
  end

  def is_painted?
    @is_painted
  end

  def area
    @length * @width.to_i
  end
end
