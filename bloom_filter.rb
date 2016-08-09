require 'bitarray'
require 'murmurhash3'

class BloomFilter
  def initialize(size, hash_count)
    @size = size
    @hash_count = hash_count
    @bit_array = BitArray.new(@size)
  end

  def add(string)
    (0...@hash_count).to_a.each do |seed|
      result = MurmurHash3::V32.str_hash(string, seed) % @size
      @bit_array[result] = 1
    end
  end

  def lookup(string)
    (0...@hash_count).to_a.each do |seed|
      result = MurmurHash3::V32.str_hash(string, seed) % @size
      return "no way" if @bit_array[result] == 0
    end
    return "maybe"
  end
end

bf = BloomFilter.new(500000, 7)
dict = []
File.open("/usr/share/dict/words", "r") do |f|
  f.each_line do |line|
    bf.add(line)
    dict << line
  end
end

start = Time.now
bf.lookup("google")
bloom_filter_time = Time.now - start

start = Time.now
dict.each do |word|
  break if word == "google"
end
dict_time = Time.now - start

p "Faster by: #{dict_time/bloom_filter_time}"
