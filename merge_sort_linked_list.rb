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

def merge(node1, node2)
  current1 = node1
  current2 = node2
  new_list = nil
  prev = nil
  if (node1 && node2 && node1.val < node2.val) || (node1 && node2.nil?)
    new_list = node1
    current1 = current1.next
  elsif (node1 && node2 && node2.val < node1.val) || (node2 && node1.nil?)
    new_list = node2
    current2 = current2.next
  end

  prev = new_list
  while (current1 && current2) do
    if (current1.val < current2.val)
      prev.next = current1
      prev = current1
      current1 = current1.next
    else
      prev.next = current2
      prev = current2
      current2 = current2.next
    end
  end

  while current1 do
    prev.next = current1
    prev = current1
    current1 = current1.next
  end

  while current2 do
    prev.next = current2
    prev = current2
    current2 = current2.next
  end
  new_list
end

def merge_sort(pList, length)
  if length == 0 || length == 1
    pList
  else
    middle = length/2
    end_value = pList
    prev = pList

    middle.times do
      prev = end_value
      end_value = end_value.next
    end

    prev.next = nil
    node1 = merge_sort(pList, middle)
    node2 = merge_sort(end_value, length-middle)
    return merge(node1, node2)
  end
end

linked_list = create_linked_list([11,4,6,7,1,-99,0,2])
puts length(linked_list)
print(merge_sort(linked_list, length(linked_list)))
