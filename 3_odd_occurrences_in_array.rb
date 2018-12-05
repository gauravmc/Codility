# Write an efficient algorithm for the following assumptions:

#   N is an odd integer within the range [1..1,000,000];
#   each element of array A is an integer within the range [1..1,000,000,000];
#   all but one of the values in A occur an even number of times.

def solution(a)
  a.group_by(&:itself).detect {|k, v| v.size.odd?}[0]
end
