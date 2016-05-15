class MinStack
  def initialize()
    @data = []
    @minimum = []
  end

  def push(value)
    if self.get_min.nil? || value <= self.get_min
      @minimum.unshift(value)
    end
    @data.unshift(value)
  end

  def get_min
    @minimum.first
  end
end

a = MinStack.new()
a.push(8)
puts a.get_min
a.push(2)
puts a.get_min
a.push(-2)
puts a.get_min
