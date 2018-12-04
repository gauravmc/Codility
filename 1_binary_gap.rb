BINARY_GAP_RGX = /1(0+)(?=1)/

def binary_gap(num)
  matches = num.to_i.to_s(2).scan(BINARY_GAP_RGX)
  longest_gap = matches.map(&:first).max_by(&:size)
  longest_gap ? longest_gap.size : 0
end
