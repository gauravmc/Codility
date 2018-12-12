# Write a function:

#     def solution(a)

# that, given an array A consisting of N integers, returns the maximum sum of any slice of A.

def solution(a)
  max_ending = max_slice = -1_000_000

  a.each do |num|
    max_ending = [num, max_ending + num].max
    max_slice = [max_slice, max_ending].max
  end

  max_slice
end
