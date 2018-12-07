DNA = {
  'A' => 1,
  'C' => 2,
  'G' => 3,
  'T' => 4
}

# Elegeant solution, O(N*M), 75/100

def solution(s, p, q)
  answers = []
  m = p.size
  
  (0...m).each do |i|
    substr = s[p[i]..q[i]]
    if substr
      answers << impact_for_substr(substr)
    else
      answers << 0
    end
  end
  
  answers
end

def impact_for_substr(s)
  if /A/ =~ s
    DNA['A']
  elsif /C/ =~ s
    DNA['C']
  elsif /G/ =~ s
    DNA['G']
  elsif /T/ =~ s
    DNA['T']
  end
end

# Performant but difficult to read, O(N+M), 100/100

def solution(s, p, q)
  # prefix sums
  n = s.length
  prefix_sums = Array.new(n) {Array.new(DNA.size, 0)}
  (0..n).each do |i|
    next if i == 0
    prefix_sums[i] = prefix_sums[i-1].dup
    prefix_sums[i][DNA[s[i-1]] - 1] += 1
  end

  answers = []
  m = p.size
  
  (0...m).each do |i|
    diff_sums = prefix_sums[q[i] + 1].map.with_index {|e, j| e - prefix_sums[p[i]][j]}
    diff_sums.each_with_index do |v, k|
      if v > 0
        answers << DNA[DNA.key(k + 1)]
        break
      end
    end
  end
  
  answers
end
