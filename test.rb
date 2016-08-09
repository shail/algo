class LinkedListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next= nil
  end
end

def median(linked_list)
  start = linked_list.val
  linked_list = linked_list.next
  value = start
  count = 0
  breaking_point = nil
  while linked_list.val != start do
    count += 1
    breaking_point = linked_list if linked_list.val < value
    value = linked_list.val
    linked_list = linked_list.next
  end

  (count/2).times do
    breaking_point = breaking_point.next
  end
  puts breaking_point.val
end

head = LinkedListNode.new(5)
first = LinkedListNode.new(6)
second = LinkedListNode.new(7)
third = LinkedListNode.new(8)
fourth = LinkedListNode.new(10)
fifth = LinkedListNode.new(33)
sixth = LinkedListNode.new(1)
seventh = LinkedListNode.new(2)
eight = LinkedListNode.new(4)

head.next = first
first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth
sixth.next = seventh
seventh.next = eight
eight.next = head

median(third)
