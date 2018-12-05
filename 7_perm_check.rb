# Write an efficient algorithm for the following assumptions:

#   N is an integer within the range [1..100,000];
#   each element of array A is an integer within the range [1..1,000,000,000].

def solution(a)
  permutation = (1..a.size).to_a
  (permutation - a).empty? ? 1 : 0
end
