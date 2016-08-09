class LinkedListNode
  attr_accessor :val, :next
  def initialize(node_value)
    @val = node_value
    @next = nil
  end
end

head = LinkedListNode.new(1)
second = LinkedListNode.new(2)
third = LinkedListNode.new(3)
fourth = LinkedListNode.new(4)
head.next = second
head.next.next = third
head.next.next.next = fourth

def reverse_linked_list(head)
  prev = nil
  current = head
  next_node = nil

  while !current.nil? do
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end
  return prev
end

p reverse_linked_list(head)
