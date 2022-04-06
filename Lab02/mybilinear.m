function [out_val] = mybilinear(x, y, p)
%MYBILINEAR Summary of this function goes here
%   syntax:
% 
%   input:
% 
%   History:
%   3/1 Initialized function script
%   3/8 Set up and completed bilinear interpolation. Functions as expected.
%   Tested using HW example problem.
A = [x(1,1), x(1,2), x(1,1)*x(1,2), 1;
     x(2,1), x(2,2), x(2,1)*x(2,2), 1;
     x(3,1), x(3,2), x(3,1)*x(3,2), 1;
     x(4,1), x(4,2), x(4,1)*x(4,2), 1;
    ];


b = [y(1,1); y(2,1); y(3,1); y(4,1)];

% if det(A)~= 0 
%     solution_vector = A\b;
% else
    solution_vector = linsolve(A,b);
% end


out_val= solution_vector(1)*p(1)+solution_vector(2)*p(2)+solution_vector(3)*p(1)*p(2)+ solution_vector(4);
end

% Given syntax from lab
% mybilinear(x,y,p)
% where x and y are the five pixel locations and p are the values of the 4 known pixels
% v(x,y) = ax +by + cxy + d
% 
% function [Y] = trad_bil(I, ratio)
% [h, w] = size(I);
% H = (ratio * h);
% W = (ratio * w);
% Y = zeros(H,W);
% hs = (h/H);
% ws = (w/W);
%     for i=1:H
%       y = (hs * i) + (0.5 * (1 - 1/ratio));
%         for j=1:W
%            x = (ws * j) + (0.5 * (1 - 1/ratio));
%       %// Any values out of acceptable range
%           x(x < 1) = 1;
%           x(x > h - 0.001) = h - 0.001;
%           x1 = floor(x);
%           x2 = x1 + 1;
%           y(y < 1) = 1;
%           y(y > w - 0.001) = w - 0.001;
%           y1 = floor(y);
%           y2 = y1 + 1;
%       %// 4 Neighboring Pixels
%           NP1 = I(y1,x1);
%           NP2 = I(y1,x2);
%           NP3 = I(y2,x1); 
%           NP4 = I(y2,x2);
%       %// 4 Pixels Weights
%           PW1 = (y2-y)*(x2-x);
%           PW2 = (y2-y)*(x-x1);
%           PW3 = (x2-x)*(y-y1);
%           PW4 = (y-y1)*(x-x1);
%           Y(i,j) = PW1 * NP1 + PW2 * NP2 + PW3 * NP3 + PW4 * NP4;
%         end
%     end
%   end

