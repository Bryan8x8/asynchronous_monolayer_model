function parsed_seeds = seedParser(input)
 
    parsed_seeds = [];
    row = 1;
    row_toBeAdded = [];
    input = cell2mat(num2cell(input));
    i = 1;
    while i < size(input,2)
        testVal = input(i);
        [foundFlag, foundNum] = findNum(testVal);
        if(foundFlag == 1)
            currVal = foundNum;
            numFlag = 0;
            i = i + 1;
            testVal = input(i);
            while numFlag == 0
                [foundFlag, foundNum] = findNum(testVal);
                if foundFlag == 1
                    currVal = (currVal*10) + foundNum;
                    i = i + 1;
                    testVal = input(i);
                else 
                    numFlag = 1;
                end
                
            end 
            %we have escaped the while loop and the currVal holds a point
            %value
            
            %we will use a series of flags to determine how currVal will be
            %palaced into the parsed_seeds matrix.
            if size(row_toBeAdded, 2) < 2
                row_toBeAdded = [row_toBeAdded currVal];
            else 
                parsed_seeds = [parsed_seeds; row_toBeAdded];
                row_toBeAdded = [currVal];
               
            end
            
        end 
        i = i + 1;
    end
    if size(row_toBeAdded, 2) == 2
       parsed_seeds = [parsed_seeds; row_toBeAdded]; 
    end
end
 
function [foundFlag, foundNum] = findNum(input)
    switch(input)
        case '1'
            foundFlag = 1;
            foundNum = 1;
        case '2'
            foundFlag = 1;
            foundNum = 2;
        case '3'
            foundFlag = 1;
            foundNum = 3;
        case '4'
            foundFlag = 1;
            foundNum = 4;
        case '5'
            foundFlag = 1;
            foundNum = 5;
        case '6'
            foundFlag = 1;
            foundNum = 6;
        case '7'
            foundFlag = 1;
            foundNum = 7;
        case '8'
            foundFlag = 1;
            foundNum = 8;
        case '9'
            foundFlag = 1;
            foundNum = 9;
        case '0'
            foundFlag = 1;
            foundNum = 0;
        otherwise
            foundFlag = 0;
            foundNum = 0;
    end
end

%Expected input [2,1 ; 1,3]