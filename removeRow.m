function fixed_array = removeRow(array, i)
    height = size(array,1);
    if i == 1
        fixed_array = array(2:end, :);
    elseif i == height
        fixed_array = array(1:height-1, :);
    else
        part_one = array(1:i-1, :);
        part_two = array(i+1:end, :);
        fixed_array = [part_one ; part_two];
    end
end

%{
function fixed_array = removeColumn(array, i)

edits out column i from array and returns a fixed array
this only accepts the first row of the given array
%}