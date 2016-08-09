class ListNode
  attr_accessor :val, :right, :child
  def initialize(val)
    @val = val
    @right = nil
    @child = nil
  end
end


def flatten_list(head)
  # base case
  return if head.nil?

  # find tail node of first level linkedlist
  tail = head
  while !tail.next.nil? do
    tail = tail.next
  end

  # one by one traverse through all nodes of first level linked list till we reach the tail
  cur = head
  while cur != head do
    # if current node has a child
    if cur.child?
      # append the child at the end of the current list
      tail.next = cur.child

      # update the tail to new last node
      temp = cur.child
      while temp.next do
        temp = temp.next
      end
      tail = tmp
    end
    # change current node
    cur = cur.next
  end
end
