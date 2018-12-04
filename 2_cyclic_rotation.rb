def solution(a, k)
  k.times do
    a = a.rotate(1)
  end

  a
end
