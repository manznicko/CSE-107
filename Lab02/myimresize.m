function [out_mat] = myimresize(input_matrix, rowcol, method)
%myimresize Summary of this function goes here
%   This function takes in 3 arguements, a matrix, its size, and resizing
%   method, to resize the given image into a new one.
%
%   Syntax:
%       out = myimresize(in_matrix, row_and_col, method);
%       out = myimresize(in_matrix, [row col], method);
%
%   Input:
%       in_matrix = any n x n matrix that represents a greyscale image
%       where the elements are values from 0-255.
%
%       row_and_col = is a 1x2 matrix where the first element is the
%       desired row size and the second element is the desired column size
%       for the output.
%       
%       [row col] = another 1x2 matrix representation where the first
%       element is the desired row size and the second element is the
%       desired column size for resizing    .
%
%       method = is a string that is either 'nearest' or 'bilinear' to
%       determine which computational method we will use for the resizing.
%
%   History:
%   3/1 Started/completed nearest neighbor interpolation 
%   3/8 Began adding logic to calculate bilinear coordinates - kept getting
%   errors from miscalculated coordinates

%   3/15 Corrected coordinate miscalculation so bilinear is now a
%   functioning interpolatino method.

%   3/15 Updated Nearest Neighbor method to a more accurate implementation.
%   Old imlementation is commented out to see above the currently
%   implemented one.
row = rowcol(1);
col = rowcol(2);
[Minput, Ninput] = size(input_matrix);
neighbor = 'nearest';
interpolation = 'bilinear';

if(strcmp(method, neighbor) == 1)
%     ratio_row = row/size(input_matrix,1);
%     ratio_col = col/size(input_matrix,2);
% 
%     interpolate_row = ceil([1:(size(input_matrix,1)*ratio_row)]./(ratio_row));
%     interpolate_col = ceil([1:(size(input_matrix,2)*ratio_col)]./(ratio_col));
% 
%     out_mat = input_matrix(interpolate_row, :);
%     out_mat = out_mat(:, interpolate_col);
    for m=1:row
        for n=1:col
            m_inter = (((m-0.5)/row)*Minput)+0.5;
            n_inter = (((n-0.5)/col)*Ninput)+0.5;
            m1 = round(m_inter);
            n1 = round(n_inter);
            out_mat(m,n) = input_matrix(m1,n1);
        end
    end

elseif (strcmp(method,interpolation))
    x = ones(4,2); %x=[1:4;5:8;9:12;13:16];
    y = zeros(4,1); %y=[1;2;3;4]
    out_mat = zeros(row,col, 'uint8');
%     new_val = mybilinear(x, y , p);
%     out_mat = ones(row, col);
    for m=1:row
        for n=1:col
            m_inter = (((m-0.5)/row)*Minput)+0.5;
            n_inter = (((n-0.5)/col)*Ninput)+0.5;
            
            if m_inter >= 1 && m_inter<= Minput %cases to x dimension
                if m_inter ~= floor(m_inter)
                    x(1,1) = floor(m_inter);
                end
            elseif m_inter>Minput
                x(1,1) = Minput-1;

            elseif m_inter<1
                x(1,1) = 1;

            end
            
            x(2,1) = x(1,1);
            x(3,1) = x(1,1)+1;
            x(4,1) = x(3,1);

            if n_inter>= 1 && n_inter<= Ninput %Cases for y dimension
                if n_inter ~= floor(n_inter)
                    x(1,2) = floor(n_inter);
                end
            elseif n_inter<1
                x(1,2) = 1;
            elseif n_inter>Ninput
                x(1,2) = Ninput-1;
            end
            x(2,2) = x(1,2) +1;
            x(3,2) = x(1,2);
            x(4,2) = x(2,2);
            p = [m_inter, n_inter];

            y(3,1) = input_matrix(x(1,1),x(1,2));
            y(2,1) = input_matrix(x(2,1),x(2,2));
            y(1,1) = input_matrix(x(3,1),x(3,2));
            y(4,1) = input_matrix(x(4,1),x(4,2));

            p5 = mybilinear(x,y,p);
            out_mat(m,n) = round(p5);

        end
    end
else
    fprintf('Method given for image resize is not a possible option');
    out_mat = (-1);

end

end

