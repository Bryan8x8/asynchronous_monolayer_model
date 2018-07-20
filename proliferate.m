function [p_array, cell_matrix] = proliferate(p_array, seed)

    len = size(p_array,1);
    
    for i=1:len
        %ptest = rand;
        p_array(i,4) = p_array(i,4) + 1;
        point = p_array(i,:);
        if point(1,3) == point(1,4)   
         p_array(i,4) = 0;
         availability_one = checkOne(point, seed);
         availability_two = checkTwo(point,seed);
         if size(availability_one,2) > 0 || size(availability_two,2) > 0
            availability = [availability_one availability_two];
            a1_len = size(availability, 2);
            cellTest = randi([1 a1_len]);
            toFill = availability(1, cellTest);
            [col_edit,row_edit] = fillCell(toFill);
            seed((point(1,1) + row_edit) ,(point(1,2)+ col_edit)) = 100;
            assignment = setAssignment();
            p_array = [p_array; (point(1,1)+row_edit) (point(1,2)+ col_edit) assignment 0];
         end
         
        end
    
   
    end
    
    cell_matrix = seed;
    
    %the seed has been properly edited and can be returned as the
    %cell_matrix, now what is left is to edit the p_array and remove all
    %points that are no longer perimiter values from the p_array and return
    %the updated array
    
    fixed_array = p_array;
    j = 1;
    len = size(p_array,1);
    for i=1:len
        point = p_array(i,:);
        availability_one = checkOne(point, seed);
        availability_two = checkTwo(point, seed);
        if size(availability_one,2) == 0 && size(availability_two,2) == 0
            fixed_array = removeRow(fixed_array, j);
            j = j - 1;
        end
        j = j + 1;       
    end
    p_array = fixed_array;
        
end

%{
p_array = proliferate(p, p1);

Parameters:

p - probability that a cell will expand to either N,S,E,W open cell

p1 - probability that a cell will expand to either NE, SE, NW, SW, open
cell

p_array - takes a perimeter array listing all the cells that currently
surround the perimeter

seed - takes in an initial cell matrix that corresponds to input p_array

Returns:

p_array - an updatd p_array from the initial p_array input.

cell_matrix - updated cell matrix.

how can I make this faster?

option 1: maybe I can have an array of perimeter cells.
option 2: maybe just iterate through all cells. 

I've gone with option one. 

Becuase the user should never directly access this function it is safe to
assume that the correct p_array and seed will be input, incorrect pairing
would be disasterous...

For ever perimeter value I will check to see if they proliferate

for every successful cell expansion I will update the cell_matrix

and place each new cell in a temporary perimeter expansion array.

one I have gone through p_array I will then check to see if any of the
perimeter cells are no longer on the perimeter and clean the matrix as
necessary

I will then append the cleaned p_array to the new cell array to create and 
return a new p_array 

I have to be careful not exceed array bounds, seed dimensions will contain
this info
%}