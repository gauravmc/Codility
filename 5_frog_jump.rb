# Write an efficient algorithm for the following assumptions:

#   X, Y and D are integers within the range [1..1,000,000,000];
#   X ≤ Y.

def solution(x, y, d)
  ((y - x).to_f / d).ceil
end
