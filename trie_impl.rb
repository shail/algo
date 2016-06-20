class Trie
  attr_accessor :children, :is_leaf
  def initialize(is_leaf = false)
    @children = Array.new(26)
    @is_leaf = is_leaf
  end
end

def char_to_index(key)
  key.ord - 'a'.ord
end

def insert(root, key)
  length = key.length
  crawler = root
  (0...length).to_a.each do |level|
    index = char_to_index(key[level])
    crawler.children[index] = Trie.new() if !crawler.children[index]
    crawler = crawler.children[index]
  end

  crawler.is_leaf = true
end

def search(root, key)
  length = key.length
  crawler = root
  (0...length).to_a.each do |level|
    index = char_to_index(key[level])
    return false if !crawler.children[index]
    crawler = crawler.children[index]
  end
  return !crawler.nil? && crawler.is_leaf
end
