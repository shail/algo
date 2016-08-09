class Node
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end
INT_MIN = -2**63 + 1
INT_MAX = 2**63 - 1
def bst_valid(root, min, max)
  return true if root.nil?

  if root.val < min || root.val > max
    return false
  end

  # otherwise check subtrees recursively
  # only allow distinct values
  return bst_valid(root.left, min, root.data - 1) &&
        bst_valid(root.right, root.data + 1, max)
end
