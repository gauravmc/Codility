# Write a function:

#     def solution(a)

# that, given a non-empty array A, returns the value of the maximal product of any triplet.

def solution(a)
  a.sort!

  # Take two highest possible products
  product_1 = (a.first(2) << a.last).inject(:*)
  product_2 = a.last(3).inject(:*)

  product_1 > product_2 ? product_1 : product_2
end
