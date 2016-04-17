def mergeFirstIntoAnother(intArrShort, intArrLong)
  intArrShortStart = 0
  intArrLongStart = 0
  length = intArrShort.length-1

  while (intArrShortStart < intArrShort.length && intArrLongStart < intArrLong.length) do
    if (intArrShort[intArrShortStart] < intArrLong[intArrLongStart] || intArrShort[intArrShortStart] == intArrLong[intArrLongStart])
      intArrLong[intArrLongStart+1..length+intArrLongStart+1] = intArrLong[intArrLongStart..length+intArrLongStart-intArrShortStart]
      intArrLong[intArrLongStart] = intArrShort[intArrShortStart]
      intArrShortStart += 1
      intArrLongStart += 1
    elsif intArrLong[intArrLongStart] == 0
      intArrLong[intArrLongStart] = intArrShort[intArrShortStart]
      intArrShortStart += 1
    else
      intArrLongStart += 1
    end
  end
  puts intArrLong.inspect
end

mergeFirstIntoAnother([1,2,3],[4,5,6,0,0,0])
mergeFirstIntoAnother([7,8,9],[4,5,6,0,0,0])
mergeFirstIntoAnother([4,5],[4,5,0,0])
mergeFirstIntoAnother([1,7,8],[2,4,10,0,0,0])
