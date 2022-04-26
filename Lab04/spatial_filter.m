function [mat] = spatial_filter(inp, sobel)
%SPATIAL FILTER Summary of this function goes here:
%     This function takes in two arguments, an image matrix
%     and a filter of any nxn size and applies the filter to
%     the image matrix.
% Syntax:
%     out = spatial_filter(ipnut_matrix, filter);

% Input:
%     input_matrix = any n x m matrix that represents a greyscale image
%     where the elements are values from 0-255.

%     filter = any n x n matrix where each element is a seperate
%     filter value.

% History:
%     4/12 - Started function implementation, initialization of variables
%     4/18 - Added padding for image matrix, implemented filter application to image
%     4/19 - Finished function implementation

[row, col] = size(inp);
[R,S] = size(sobel);
mat = double(zeros(row,col));
pad = (R-1)/2;
pad_input = double(zeros(2*pad+row, 2*pad+col));

% copy matrix over
for i=1:row
    for j=1:col
        pad_input(i+pad,j+pad) = inp(i,j);
    end
end



for m=1:row
    for n=1:col
        for s=1:R
            for t=1:S
                mat(m,n) = mat(m,n) + sobel(s,t)*pad_input(m+s-1,n+t-1);
            end
        end
    end
end

end