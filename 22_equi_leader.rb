# Write a function:

#   def solution(a)

# that, given a non-empty array A consisting of N integers, returns the number of equi leaders.

def solution(a)
  leader, count = array_leader(a)
  return 0 unless leader

  n = a.size
  head_count = 0
  total_equis = 0
  a.each_with_index do |e, i|
    head_count += 1 if e == leader
    tail_count = count - head_count

    if (head_count > (i + 1)/2) && (tail_count > (n - 1 - i)/2)
      total_equis += 1
    end
  end

  total_equis
end

def array_leader(ary)
  stack = []

  ary.each do |e|
    stack.push(e)

    if stack.size >= 2
      first, second = stack.pop, stack.pop
      if first == second
        stack.push(second)
        stack.push(first)
      end
    end
  end

  leader, count, candidate = nil, 0, stack.pop

  if candidate
    count = ary.count {|e| e == candidate}
    leader = candidate if count > ary.size / 2
  end

  [leader, count]
end
