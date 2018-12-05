# Write an efficient algorithm for the following assumptions:

#   N is an integer within the range [2..100,000];
#   each element of array A is an integer within the range [−1,000..1,000].

def solution(a)
  head = a.first
  tail = a.drop(1).inject(:+)
  min_diff = (head - tail).abs

  (1...a.size - 1).each do |i|
    head += a[i]
    tail -= a[i]
    if (head - tail).abs < min_diff
      min_diff = (head - tail).abs
    end
  end

  min_diff
end
