function [edges] = find_edges(inp, t)
% FIND EDGES Summar of function goes here:
%     This function takes in two arguements, an image matrix 
%     and a integer that are used to calculate the edges 
%     detected in a given image.
% Syntax:
%     out = find_edges(input_matrix, threshold);

% Input:
%     input_matrix =  any n x m matrix that represents a greyscale image
%     where the elements are values from 0-255.

%     threshold = an integer value between 0 - 255

% History:
%     4/12 - Started function implementation, Initialized variables
%     4/19 - Added call to gradient_magnitude
%     4/20 - Added threshold edge detection
%     4/20 - Finished function implementation 
    
[M,N] = size(inp);
edges = zeros(M,N);

g = gradient_magnitude(inp);

% % threshold here
% From pdf: value 255 where edges are detected and 0 elsewhere
% edges = %
for m=1:M
    for n=1:N
        if(g(m,n) > t)
            edges(m,n) = 255;
        else
            edges(m,n) = 0;
        end
    end
end

edges = uint8(edges);
end