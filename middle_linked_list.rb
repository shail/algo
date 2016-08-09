class LinkedListNode
  attr_accessor :val, :next

  def initialize(node_value)
    @val = node_value
    @next = nil
  end
end

def findMiddleNode(pList)
  slow_pointer = pList
  fast_pointer = pList
  while (!fast_pointer.nil? && !fast_pointer.next.nil?) do
    slow_pointer = slow_pointer.next
    fast_pointer = fast_pointer.next.next
  end
  slow_pointer.next = nil
  slow_pointer
end

head = LinkedListNode.new(1)
head.next = LinkedListNode.new(2)
head.next.next = LinkedListNode.new(3)

def create_linked_list(vals)
  head = LinkedListNode.new(vals.shift)
  start = head
  while (!vals.empty?) do
    start.next = LinkedListNode.new(vals.shift)
    start = start.next
  end
  head
end

puts findMiddleNode(create_linked_list([1,2,3,4])).val.inspect
puts findMiddleNode(create_linked_list([1,2,3,4,5])).val.inspect
