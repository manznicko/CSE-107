function [T] = histogram_transform(hist)
%HISTOGRAM_EQUALIZATION Summary of this function goes here
%   Detailed explanation goes here
%	4/5 - Started/Finished function
	T = zeros(256,1);
	for i = 1:256
		T(i) = round(255*sum(hist(1:i)));
		end
end

