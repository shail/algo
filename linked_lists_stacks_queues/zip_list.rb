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

def last(head)
  result = nil
  while (head) do
    result = head if head.next.nil?
    head = head.next
  end
  result
end

def pop_last(head)
  while (head && head.next) do
    head.next = nil if head.next.next.nil?
    head = head.next
  end
  head
end

def zip(head)
  new_list = LinkedListNode.new(nil)
  new_list_head = new_list
  size = length(head)
  (0...size/2).to_a.each do |i|
    if i == 0
      new_list.val = last(head).val
    else
      new_list.next = last(head)
      new_list = new_list.next
    end
    pop_last(head)
  end
end

linked_list = create_linked_list([1,2,3,4,5,6])
zip(linked_list)
