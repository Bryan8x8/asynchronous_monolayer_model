function availability_one = checkOne(point, seed)
    len = size(seed,2);
    availability_one = [];
    
    %checking left
    if point(1,2) > 1
        if seed(point(1,1),point(1,2)-1) == 1 % 1 mean available
            availability_one = [availability_one 4];
        end        
    end
    
    %checking right
    if point(1,2) < len
        if seed(point(1,1),point(1,2)+1) == 1 % 1 mean available
            availability_one = [availability_one 5];
        end        
    end
    
    %checking bottom
    if point(1,1) < len
        if seed(point(1,1)+1,point(1,2)) == 1 % 1 mean available
            availability_one = [availability_one 7];
        end        
    end
    
    %checking top
    if point(1,1) > 1
        if seed(point(1,1)-1,point(1,2)) == 1 % 1 mean available
            availability_one = [availability_one 2];
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

    availability_one - available horizontal and veritcal locations.

Cell Neighbor Value Chart:

          1 2 3
          4 x 5
          6 7 8
%}