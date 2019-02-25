require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle'

def triangle(a, b, c)
  sorted = [a, b, c].sort
  raise  TriangleError,'negtive input' if a <= 0 || b <= 0 || c <= 0 
  raise TriangleError,'the longest one is larger than the sum of the rest two' if sorted[0] + sorted[1] <= sorted[2]

  if a == b && b == c
    :equilateral
  elsif sorted[1] == sorted[0] || sorted[1] == sorted[2]
    :isosceles
  else
    :scalene
  end
end

class TriangleError < StandardError
end


class AboutTriangleProject < Neo::Koan
  def test_equilateral_triangles_have_equal_sides
    assert_equal :equilateral, triangle(2, 2, 2)
    assert_equal :equilateral, triangle(10, 10, 10)
  end

  def test_isosceles_triangles_have_exactly_two_sides_equal
    assert_equal :isosceles, triangle(3, 4, 4)
    assert_equal :isosceles, triangle(4, 3, 4)
    assert_equal :isosceles, triangle(4, 4, 3)
    assert_equal :isosceles, triangle(10, 10, 2)
  end

  def test_scalene_triangles_have_no_equal_sides
    assert_equal :scalene, triangle(3, 4, 5)
    assert_equal :scalene, triangle(10, 11, 12)
    assert_equal :scalene, triangle(5, 4, 2)
  end
end
