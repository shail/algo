class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def odd_even_list(head)
  if head
    count = 0
    node = head
    second = head.next
    last = nil
    while node && node.next do
      last = node
      temp = node.next
      node.next = node.next.next
      node = temp
      count += 1
    end
    count % 2 == 0 ? node.next = second : last.next = second
    head
  end
end

head = Node.new(1)
head.next = Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(4)
head.next.next.next.next = Node.new(5)
head.next.next.next.next.next = Node.new(6)
head.next.next.next.next.next.next = Node.new(7)
head.next.next.next.next.next.next.next = Node.new(8)

p odd_even_list(head)
