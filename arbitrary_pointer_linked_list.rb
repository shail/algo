class LinkedListNode
  attr_accessor :val, :next, :arb
  def initialize(node_value)
    @val = node_value
    @next = nil
    @arb = nil
  end
end

head = LinkedListNode.new(1)
second = LinkedListNode.new(2)
third = LinkedListNode.new(3)
fourth = LinkedListNode.new(4)
head.next = second
head.next.next = third
head.next.next.next = fourth
head.arb = third
second.arb = head
third.arb = second
fourth.arb = third

def print_copy(head)
  result = []
  count = 0
  while (head.next) do
    if count % 2 == 1
      result << [head.val, head.arb.val]
    end
    head = head.next
    count += 1
  end
  result << [head.val, head.arb.val]
  puts result
end

def copy_special_linked_list(linked_list)
  head = linked_list
  while (head.next) do
    next_node = head.next
    head.next = LinkedListNode.new(head.val)
    head.next.next = next_node
    head = head.next.next
  end
  head.next = LinkedListNode.new(head.val)

  head = linked_list
  while (head.next && head.next.next) do
    head.next.arb = head.arb.next
    head = head.next.next
  end
  head.next.arb = head.arb.next

  print_copy(linked_list)
end

copy_special_linked_list(head)
