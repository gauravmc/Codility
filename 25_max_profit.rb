# Write a function,

#     def solution(a)

# that, given an array A consisting of N integers containing daily prices of a stock share for a period of N consecutive days, returns the maximum possible profit from one transaction during this period. The function should return 0 if it was impossible to gain any profit.


def solution(a)
  max_profit_so_far = 0
  max_profit = 0

  (1...a.size).each do |i|
    profit = a[i] - a[i - 1]
    max_profit_so_far = [profit, max_profit_so_far + profit].max
    max_profit = [max_profit_so_far, max_profit].max
  end

  max_profit
end
