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

def print(pList)
  result = []
  result << pList.val
  while (!pList.next.nil? && pList = pList.next) do
    result << pList.val
  end
  puts result
end

def length(head)
  length = 0
  while (head) do
    length += 1
    head = head.next
  end
  length
end

def zip(pList)
  size = length(pList)
  head = pList
  new_list = nil

  (0..(size/2)-1).to_a.each do |i|
    new_list.push(head.last)
    head.pop_last
  end
  print(pList)
end

linked_list = create_linked_list([1,2,3,4,5,6])
size = length(linked_list)
zip(linked_list)

