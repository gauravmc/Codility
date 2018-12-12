# Write a function

#     def solution(a)

# that, given an array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.

def solution(a)
  index = -1
  candidates = []

  a.each_with_index do |num, i|
    candidates.push([num, i])

    if candidates.size > 1
      2.times {candidates.pop} if candidates[-1][0] != candidates[-2][0]
    end
  end

  if candidate = candidates.pop
    count = a.count {|num| num == candidate[0]}
    index = candidate[1] if count > a.size / 2
  end

  index
end
