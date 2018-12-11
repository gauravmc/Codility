# Write a function:

#     def solution(h)

# that, given an array H of N positive integers specifying the height of the wall, returns the minimum number of blocks needed to build it.

# Note: There are shorter solutions out there that do things like stack.empty? or stack[], but I don't think that's right.
# Stack should only be accessed as .push and .pop. Which is why this solution is slight more verbose.

BLOCK_STACK = []

def solution(h)
  blocks = 0
  blocks = add_new_block(blocks, h.first)

  (1...h.size).each do |i|
    last_ht, ht = BLOCK_STACK.pop, h[i]
    if last_ht > ht
      while last_ht && last_ht > ht
        last_ht = BLOCK_STACK.pop
      end

      if last_ht == ht
        BLOCK_STACK.push(last_ht)
      else
        BLOCK_STACK.push(last_ht)
        blocks = add_new_block(blocks, ht)
      end
    elsif last_ht < ht
      BLOCK_STACK.push(last_ht)
      blocks = add_new_block(blocks, ht)
    elsif last_ht == ht
      BLOCK_STACK.push(last_ht)
    end
  end

  blocks
end

def add_new_block(total, value)
  total += 1
  BLOCK_STACK.push(value)
  total
end
