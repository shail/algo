$tower = [[0,1,2,3,4,5],[],[]]
def move_tower(tower, disk, source, dest, spare)
  if disk == 0
    temp = tower[source].shift
    tower[dest].unshift(temp)
  else
    move_tower(tower, disk-1, source, spare, dest)
    temp = tower[source].shift
    tower[dest].unshift(temp)
    move_tower(tower, disk-1, spare, dest, source)
  end
  tower
end

tower = [[0,1,2,3,4,5],[],[]]
puts move_tower(tower, 5,0,1,2).inspect
