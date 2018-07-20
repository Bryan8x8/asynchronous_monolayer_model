function [seed_matrix, p_array] = seedFunc(toSeed, type, numSeeds, seedArray)

    len = size(toSeed,2);
    
    if nargin == 3
        
        if(type ~= 'r')
            msgID = 'seed_matrix:IncompatibleArguements';
            msg = 'seedArray is incompatible with type';
            baseException = MException(msgID,msg);
            throw(baseException); 
        else
            p_array = zeros(numSeeds,4);
            for i=1:numSeeds
                row = randi([0 len]);
                col = randi([0 len]);
                p_array(i,1) = row;
                p_array(i,2) = col;
                assignment = setAssignment();
                p_array(i,3) = assignment; % holds assignment 3 4 5
                p_array(i,4) = 0; % holds counter which tells proliferate function when to proliferate
                toSeed(row,col) = 100;
            end
            seed_matrix = toSeed;
        end 
        
        
        
    elseif nargin == 4
        
        if(type ~= 's')
            msgID = 'seed_matrix:IncompatibleArguements';
            msg = 'seedArray is incompatible with type';
            baseException = MException(msgID,msg);
            throw(baseException);
        else 
            if(size(seedArray,1) ~= numSeeds)
                msgID = 'seed_matrix:IncompatibleArguements';
                msg = 'seedArray is incompatible with numSeeds';
                baseException = MException(msgID,msg);
                throw(baseException);
            end 
            
            for i=1:numSeeds
                row = seedArray(i,1);
                col = seedArray(i,2);
                toSeed(row,col) = 100;
            end 
            seed_matrix = toSeed;
            len = size(seedArray,1);
            p_array = zeros(len,4);
            for i=1:len
                p_array(i,1) = seedArray(i,1);
                p_array(i,2) = seedArray(i,2);
                assignment = setAssignment();
                p_array(i,3) = assignment;
                p_array(i,4) = 0;
            end
        end 
        
        
    else
        
        msgID = 'seed_matrix:BadArgumentCount';
        msg = 'Invalid Number of Arguments';
        baseException = MException(msgID,msg);
        throw(baseException);  
    end 
end

%{
[seed_matrix, p_array] = seedFunc(toSeed, type, numSeeds, seedArray):

Parameters: 

toSeed - array that will be seeded by the function.

type -  determines the method by which the seeds will be set 
in the cell_matrix, 'r' for random placement, and 's' for a predetermined
placement

numSeeds - sets the amount of seeds to be placed in cell_matrix

seedArray - this is only necessary if a type 's' was selected, this
argument requires a numSeeds*n array with each seeds coordinates listed in
each row, first column is x position, second column is y position

Returns:

seed_matrix - a cell matrix with seeds placed

p_array - an array containing initial colony perimiter values

%}