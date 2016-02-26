def move_zeros(nums)
    counter = 0
    nums.length.times do
      if nums[counter] == 0
        nums.delete_at(counter)
        nums << 0
      else
        counter += 1
      end
    end
    nums
end

puts move_zeros([0,1,0,3,12])
