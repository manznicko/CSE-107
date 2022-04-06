function [vec] = compute_histogram(img)
%COMPUTE_HISTOGRAM Summary of this function goes here
%   Detailed explanation goes here
% 3/29
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

