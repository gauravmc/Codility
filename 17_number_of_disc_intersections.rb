# Write a function:

#     def solution(a)

# that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs. The function should return −1 if the number of intersecting pairs exceeds 10,000,000.

def solution(a)
  return 0 unless a.size > 1

  disc_edges = []
  a.each_with_index do |r, j|
    disc_edges << [j - r, :begin]
    disc_edges << [j + r, :end]
  end

  disc_edges.sort_by! {|point, status| [point, status]}

  active_discs = 0
  intersections = 0

  disc_edges.each do |edge|
    if edge[1] == :begin
      intersections += active_discs
      active_discs += 1
    else
      active_discs -= 1
    end
  end

  return -1 if intersections > 10_000_000

  intersections
end
