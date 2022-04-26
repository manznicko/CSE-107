function [grad] = gradient_magnitude(input)
% GRADIENT MAGNITUDE Summary of this function goes here:
%     This function takes in single arguement, an image matrix
%     and calculates the gradient using two filters.
% Syntax:
%     out = gradient_magnitude(ipnut_matrix);

% Input:
%     input_matrix =  any n x m matrix that represents a greyscale image
%     where the elements are values from 0-255.

% History:
%     4/12 - Started function implementation, Initilized output matrix and filters
%     4/19 - Finished function implementaton
    
    
[M,N] = size(input);
grad = zeros(M,N);

sobel_x= [1 ,0 ,-1; 2,0,-2; 1, 0 ,-1];
sobel_y= [1,2,1; 0,0, 0; -1, -2 ,-1];

grad_x = spatial_filter(input, sobel_x);
grad_y = spatial_filter(input, sobel_y);

grad = double(sqrt(grad_x.^2 + grad_y.^2));


end