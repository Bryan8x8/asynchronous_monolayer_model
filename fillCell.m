function [col_edit,row_edit] = fillCell(n)
    switch n
    case 1
        col_edit = -1;
        row_edit = -1;
    case 2
        col_edit = 0;
        row_edit = -1;
    case 3
        col_edit = 1;
        row_edit = -1;
    case 4
        col_edit = -1;
        row_edit = 0;
    case 5
        col_edit = 1;
        row_edit = 0;
    case 6
        col_edit = -1;
        row_edit = 1;
    case 7
        col_edit = 0;
        row_edit = 1;
    case 8
        col_edit = 1;
        row_edit = 1;       
    otherwise
        col_edit = 0;
        row_edit = 0;
    end
end