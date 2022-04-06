function [e] = myRMSE(A,B)
% MYRMSE Summary of this function goes here
%   This function takes in 2 arguements that are matrices that represent a greyscale image.
% 
%   Syntax:
%       out = myRMSE(input_A, input_B);
% 
%   Input:
%       input_A = an m x n matrix that represents a greyscale image.
%       input_B = an m x n matrix that represents the same greyscale image as input_A.
% 
%   History:
%   3/1 Started/completed myRMSE() function.

e = sqrt(mean(mean((double(A) - double(B)).^2)));

end

