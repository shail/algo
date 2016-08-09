def spiral_print(matrix)
  ending_row_index = matrix.length
  ending_column_index = matrix.first.length
  starting_row_index = 0
  starting_column_index = 0

  while starting_row_index < ending_row_index && starting_column_index < ending_column_index do
    # Print first row from remaining
    (starting_column_index...ending_column_index).to_a.each do |i|
      puts matrix[starting_row_index][i]
    end
    starting_row_index += 1

    # Print last column
    (starting_row_index...ending_row_index).to_a.each do |i|
      puts matrix[i][ending_column_index-1]
    end
    ending_column_index -= 1

    # Print last row
    if starting_row_index < ending_row_index
      (ending_column_index-1).downto(starting_column_index).to_a.each do |i|
        puts matrix[ending_row_index - 1][i]
      end
    ending_row_index -= 1
    end

    #Print first column
    if starting_column_index < ending_column_index
      (ending_row_index-1).downto(starting_row_index).to_a.each do |i|
        puts matrix[i][starting_column_index]
      end
      starting_column_index += 1
    end
  end
end
