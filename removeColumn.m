function fixed_array = removeRow(array, i)

part_one = array(1, 1:(i-1));
part_two = array(1, (i+1):end);

fixed_array = [part_one part_two];
end

%{
function fixed_array = removeColumn(array, i)

edits out column i from array and returns a fixed array
this only accepts the first row of the given array
%}