function [vec] = compute_histogram(img)
%COMPUTE_HISTOGRAM Summary of this function goes here:
%     Takes in a greyscale image matrix and computes a noralized histogram of the image.

% Syntax:
%     out = compute_histogram(in);

% Input:
%     in = the matrix of a greyscale image. It should be of type uint8 and have values that range from 0-255

% Output:
%     out = a vector of length 256 that contains the normalized values of the input image. Values should range from 0-1
%         and the sum of the elements should equal 1.

%   History:
%   3/29 - Started/Completed the function compute_histogram 

    vec = zeros(256, 1);
    [row, col] = size(img);
    for i=1:row
        for j = 1:col
%             disp(i);
%             disp(j);
%             disp(img(i,j));
            vec(img(i,j)+1) = vec(double(img(i,j)+1))+1;
        end
    end
    %Normalize the vector
    vec = vec./(row*col);

end

