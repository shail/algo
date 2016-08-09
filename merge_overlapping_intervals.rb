def overlapping_intervals(intervals)
  length = intervals.length
  return if length <= 0

  intervals.sort_by! do |item|
    item[0]
  end

  index = 0
  # traverse all intervals
  (0...length).to_a.each do |i|
    # if this is not the first interval and overlaps with the previous one
    if index != 0 && intervals[index-1][0] <= intervals[i][1]
      while index != 0 && intervals[index-1][0] <= intervals[i][1] do
        # merge previous and current intervals
        intervals[index-1][1] = [intervals[index-1][1], intervals[i][1]].max
        intervals[index-1][0] = [intervals[index-1][0], intervals[i][0]].min
        index -= 1
      end
    else
      # doesn't overlap with previous, add to solution
      intervals[index] = intervals[i]
    end
    index += 1
  end
  intervals[0..index-1]
end

p overlapping_intervals([[2,4],[1,3],[6,7],[6,8]])
