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

def swap_nodes(head, prev1, node1, prev2, node2)
  if node1.nil? || node2.nil?

  else
    if prev1.nil?
      head = node2
    else
      prev1.next = node2
    end

    if prev2.nil?
      head = node1
    else
      prev2.next = node1
    end

    temp = node1.next
    node1.next = node2.next
    node2.next = temp
  end
  head
end

def swap_k_elements(pList, k)
  prev1 = nil
  prev2 = nil
  node1 = pList
  node2 = pList
  tmp = pList
  while ((k -= 1) > 0 && tmp) do
    prev1 = tmp
    tmp = tmp.next
  end

  node1 = tmp
  while (tmp && tmp.next) do
    prev2 = node2
    node2 = node2.next
    tmp = tmp.next
  end
  swap_nodes(pList, prev1, node1, prev2, node2)
end

swap_k_elements(create_linked_list([1,2,3,4,7,0]), 2)
