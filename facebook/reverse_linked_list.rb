def reverse_linked_list_iterative(head)
  current = head

  while current do
    next_val = current.next
    current.next = prev
    prev = current
    current = next_val
  end

  head = prev
end

def recursive_reverse(head)
  return if head.nil?

  first = head
  rest = first.next

  return if rest.nil?

  recursive_reverse(rest)
  first.next.next = first
  first.next = nil
  head = rest
end
