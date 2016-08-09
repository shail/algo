class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def sorted_insert(head, new_node)
  # Linked List is empty
  # Make a new node self loop, change head to new node

  current = head

  if current.nil?
    new_node.next = new_node
    # Assuming this is a pointer --> otherwise have to change a bit
    head = new_node
  # New node is to inserted just before the head node
    # Find out the last node using a loop
    # Change the next of last node
    # Change the next of new node to head
    # Change the head pointer to point to new node
  elsif current.val >= new_node.val
    while current.next != head do
      current = current.next
    end
    current.next = new_node
    new_node.next = head
    head = new_node
    # New node inserted somewhere after the head
    # Locate the node after which new node is to be inserted
    # Make next of new_node as next of the located pointer
    # Change the next of the located pointer
  else
    while current.next != head && current.next.val < new_node.val do
      current = current.next
    end

    new_node.next = current.next
    current.next = new_node
  end
end
