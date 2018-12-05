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

# If you're looking for a slightly faster but a much more
# unreadable version of this solution, that ends up passing
# the remaining 2 performance tests, then its this one here:
#
# def solution(n, a)
#   counters = Array.new(n, 0)
#   max_counter = 0
#   current_max = 0

#   a.each do |ins|
#     if ins > n
#       max_counter = current_max
#     else
#       if max_counter > counters[ins - 1]
#         counters[ins - 1] = max_counter + 1
#       else
#         counters[ins - 1] += 1
#       end

#       if current_max < counters[ins - 1]
#         current_max = counters[ins - 1]
#       end
#     end
#   end

#   counters.map! do |count|
#     count < max_counter ? max_counter : count
#   end

#   counters
# end
