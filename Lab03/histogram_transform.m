function [T] = histogram_transform(hist)
%HISTOGRAM_EQUALIZATION Summary of this function goes here:
%	Takes in a histogram vector of length 256 that contains normalized values and transforms it into a function vector T

% Syntax:
% 	out = histogram_transform(in);

% Input:
% 	in = a  vector of length 256 that contains values that range from 0 to 1 and that all elements sum up to 1.

% Output:
% 	out = a vector of length 256 that represents the equalized transformation function 

% History:
%	4/5 - Started/Finished function implementation
	T = zeros(256,1);
	for i = 1:256
		T(i) = round(255*sum(hist(1:i)));
		end
end

