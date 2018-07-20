function availability_two = checkTwo(point, seed)
    len = size(seed,2);
    availability_two = [];
    
    %checking north east
    if point(1,1) > 1 && point(1,2) < len
        if seed(point(1,1)-1,point(1,2)+1) == 1 % 1 mean available
            availability_two = [availability_two 3];
        end        
    end
    
    %checking north west
    if point(1,1) > 1 && point(1,2) > 1
        if seed(point(1,1)-1,point(1,2)-1) == 1 % 1 mean available
            availability_two = [availability_two 1];
        end        
    end
    
    %checking south east
    if point(1,1) < len && point(1,2) < len
        if seed(point(1,1)+1,point(1,2)+1) == 1 % 1 mean available
            availability_two = [availability_two 8];
        end        
    end
    
    %checking south west
    if point(1,1) < len && point(1,2) > 1
        if seed(point(1,1)+1,point(1,2)-1) == 1 % 1 mean available
            availability_two = [availability_two 6];
        end        
    end
    
end

%{
availability_one = checkOne(point, seed);

this function serves to check the availability surrounding the selected
point 

Parameters:
    
    point - this is the point for which surrounding availability will be
            checked.

    seed - given cell array which displays available and unavailable cells

Returns:

    availability_one - available diagonal positions

Cell Neighbor Value Chart:

          1 2 3
          4 x 5
          6 7 8
%}