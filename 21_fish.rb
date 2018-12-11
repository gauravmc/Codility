# Write a function:

#     int solution(int A[], int B[], int N);

# that, given two non-empty arrays A and B consisting of N integers, returns the number of fish that will stay alive.

# Note: Again, keeping the stack operations strictly .push and .pop only.

def solution(a, b)
  n = a.size
  total_upstream = 0
  downstream = []

  (0...n).each do |i|
    if b[i] == 1
      downstream.push(a[i])
    else
      alive = true

      if fish = downstream.pop
        while fish && a[i] > fish
          fish = downstream.pop
        end
      end

      if fish && a[i] < fish
        alive = false
        downstream.push(fish)
      end

      total_upstream += 1 if alive
    end
  end

  total_upstream + downstream.size
end
