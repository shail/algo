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

def alternative_split(pList)
  head1 = pList
  head2 = pList.next
  node = head2
  while (!head1.nil? && head1.next) do
    head1.next = head1.next.next
    if !node.nil? && node.next
      node.next = node.next.next
      node = node.next
    end
    head1 = head1.next
  end
  head2
end

def print(pList)
  result = []
  result << pList.val
  while (!pList.next.nil? && pList = pList.next) do
    result << pList.val
  end
  result.join(",")
end

alternative_split(create_linked_list([1,2,3,4,5,6,7]))
