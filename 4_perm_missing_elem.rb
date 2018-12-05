# Write an efficient algorithm for the following assumptions:

#   N is an integer within the range [0..100,000];
#   the elements of A are all distinct;
#   each element of array A is an integer within the range [1..(N + 1)].

def solution(a)
  ((1..a.size + 1).to_a - a).first
end
