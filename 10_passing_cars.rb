# Write an efficient algorithm for the following assumptions:

#   N is an integer within the range [1..100,000];
#   each element of array A is an integer that can have one of the following values: 0, 1.

EAST_DIRECTION = 0

def solution(a)
  going_east = 0
  passings = 0

  a.each do |direction|
    return -1 if passings > 1_000_000_000
    direction == EAST_DIRECTION ? going_east += 1 : passings += going_east
  end

  passings
end
