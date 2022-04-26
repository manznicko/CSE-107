function [theta_out, rho_out, accumulator] = hough_transform(i_edge)
%HOUGH TRANSFORM Summary of function goes here:
[row, col] = size(i_edge);
D = diag(i_edge); %an nxn matrix with the values of i_edge across he diagonal
%D = ceil(sqrt(row.^2 + col.^2));

accumulator = zeros(2*(size(D,1))+1,180);
theta = -89;
rho = 0; 
current_max = -999999999999;

% For every edge point in i_edge, plot the corresponding 
% sinusoid in the accumulator matrix.
% That is, an edge point determines an x,y pair which in turn determines the 
% relationship between rho and theta via the formula: x * cos(theta) + y * sin(theta) = rho.
%COULD ALSO use normal c=-mx+y for paramter space but the issue of +- infinity may come up
for n=1:row
    for m=1 :col
        for theta_i = 1: 180 %Use theta_i as indexing var while theta is used for the computation. Both increment.
            rho = n*cos(theta) + m*sin(theta);
            accumulator(theta_i, rho) = accumulator(theta_i, rho) + 1;

            theta = theta + 1; %Increment our theta for calculation while our theta_I increments
        end
    end
end

%Determine most visited cell in accuulator. This cell is likely the one with the most
%Intersection points between all 
[M, N] = size(accumulator);
for theta_i=1:M
    for rho_i=1:N
        if(accumulator(theta_i, rho_i) > current_max)
            current_max = accumulator(theta_i, rho_i);
            theta_out = -89+theta_i;
            rho_out = rho_i;
        end
    end
end
end