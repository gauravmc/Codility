# Write an efficient algorithm for the following assumptions:

#   N and X are integers within the range [1..100,000];
#   each element of array A is an integer within the range [1..X].

def solution(x, a)
  perm = (1..x).to_a
  return -1 unless (perm - a).empty?
  a.index(a.uniq.last)
end
