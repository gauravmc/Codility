# For example, given:
#     A[0] = 3
#     A[1] = 4
#     A[2] = 4
#     A[3] = 6
#     A[4] = 1
#     A[5] = 4
#     A[6] = 4

# the function should return [3, 2, 2, 4, 2], as explained above.

# Write an efficient algorithm for the following assumptions:

#   N and M are integers within the range [1..100,000];
#   each element of array A is an integer within the range [1..N + 1].

def solution(n, a)
  counters = Array.new(n, 0)

  a.chunk {|ins| ins > n}.each do |max_c, ary|
    if max_c
      counters = Array.new(n, counters.max)
    else
      ary.group_by(&:itself).each do |k, v|
        counters[k - 1] += v.size
      end
    end
  end

  counters
end
