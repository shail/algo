class LinkedListNode

    attr_accessor :val, :next

    def initialize(node_value)
        @val = node_value
        @next = nil
    end
end

def zip(pList)
  if (pList.next.nil? || pList.next.next.nil?)
    return
  else
    last = nil
    prev_last = pList
    head = pList
    while (!head.next.nil?) do
      prev_last = head
      head = head.next
      last = head
    end
    prev_last.next = nil
    temp = pList.next
    pList.next = last
    pList.next.next = temp
    zip(pList.next.next)
    print(pList)
  end
end

def print(pList)
  result = []
  result << pList.val
  while (!pList.next.nil? && pList = pList.next) do
    result << pList.val
  end
  result
end

head = LinkedListNode.new(8)
head.next = LinkedListNode.new(34)
head.next.next = LinkedListNode.new(66)
head.next.next.next = LinkedListNode.new(43)
head.next.next.next.next = LinkedListNode.new(88888)
head.next.next.next.next.next = LinkedListNode.new(888818)

puts zip(head).inspect
