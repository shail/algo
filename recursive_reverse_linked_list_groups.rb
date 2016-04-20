class LinkedListNode
  attr_accessor :val, :next
  def initialize(node_value)
      @val = node_value
      @next = nil
  end
end

def create_linked_list(vals)
  head = LinkedListNode.new(vals.shift)
  start = head
  while (!vals.empty?) do
    start.next = LinkedListNode.new(vals.shift)
    start = start.next
  end
  head
end

def reverse_linked_list(pList, group)
  current = pList
  next_value = nil
  prev = nil
  count = 0

  while (!current.nil? && count < group) do
    next_value = current.next
    current.next = prev
    prev = current
    current = next_value
    count += 1
  end

  if (!next_value.nil?)
    pList.next = reverse_linked_list(next_value, group)
  end
  prev
end

reverse_linked_list(create_linked_list([1,2,3,4,5,6,7,8]), 3)
