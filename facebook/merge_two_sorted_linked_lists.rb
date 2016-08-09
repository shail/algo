class Node
  attr_accessor :val, :right
  def initialize(val)
    @val = val
    @right = nil
  end
end

def merge_two_sorted_linked_lists(a, b)
  result = Node.new(nil)
  # define a fake head, then compare the first elements from each list
  ptr = result

  while a || b do
    if a && b
      if a.val < b.val
        p a.val
        ptr.right = a
        a = a.right
      else
        ptr.right = b
        b = b.right
      end
      ptr = ptr.right
    elsif !a
      ptr.right = b
      break
    elsif !b
      ptr.right = a
      break
    end
  end

  return result.right
end

head = Node.new(1)
head.right = Node.new(2)
head.right.right = Node.new(8)

head1 = Node.new(3)
head1.right = Node.new(9)

p merge_two_sorted_linked_lists(head, head1)


# Maintain a pointer that always points to the last pointer of the result list, solving the issue where the
# result list is empty.
#
# You can do without the dummy node in something like C if you maintain a pointer that always points to the
# last pointer of the result list.
