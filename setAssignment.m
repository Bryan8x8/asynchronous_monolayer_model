function assignment = setAssignment()
    %rand
    % 64%, 3
    % 32%, 4
    % 4%, 5
    testVal = rand;
    if testVal < .64
        assignment = 3;
        
    elseif testVal > .64 && testVal < .94 
        assignment = 4;
            
    elseif testVal > .94
        assignment = 5;
            
    else
        assignment = 0; 
    end 
end