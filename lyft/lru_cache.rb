class Node
  attr_accessor :key, :val, :prev, :next
  def initialize(key, value)
    @key = key
    @val = value
    @prev = nil
    @next = nil
  end
end

class LRUCache
  def initialize(size)
    @size = size
    @hash = {}
    @head = nil
    @end = nil
  end

  def remove(node)
    if !node.prev.nil?
      node.prev.next = node.next
    else
      @head = node.next
    end

    if !node.next.nil?
      node.next.prev = node.prev
    else
      @end = node.prev
    end
  end

  def set_head(node)
    node.next = @head
    node.prev = nil

    if !@head.nil?
      @head.prev = node
    end

    @head = node
    @end = @head if @end.nil?
  end

  def set(key, value)
    if @hash[key]
      old = @hash[key]
      old.val = value
      remove(old)
      setHead(old)
    else
      created = Node.new(key, value)
      if @hash.keys.length >= @size
        @hash.delete(@end.key)
        remove(@end)
        set_head(created)
      else
        set_head(created)
      end
      @hash[key] = created
    end
  end

  def get(key)
    if @hash[key]
      node = @hash[key]
      remove(node)
      set_head(node)
      node.val
    else
      -1
    end
  end
end

cache = LRUCache.new(4)
cache.set(1,5)
cache.set(2,6)
puts cache.get(2)
cache.set(3,9)
cache.set(5,3)
cache.set(6,2)
puts cache.get(1)
puts cache.get(5)
