function [grad] = gradient_magnitude(input)
% GRADIENT MAGNITUDE Summary of this function goes here:
[M,N] = size(input);
grad = zeros(M,N);

sobel_x= [1 ,0 ,-1; 2,0,-2; 1, 0 ,-1];
sobel_y= [1,2,1; 0,0, 0; -1, -2 ,-1];

grad_x = spatial_filter(input, sobel_x);
grad_y = spatial_filter(input, sobel_y);

grad = double(sqrt(grad_x.^2 + grad_y.^2));


end