function [I] = equalize(img)
%EQUALIZE Summary of this function goes here
%   Detailed explanation goes here
	img_hist = compute_histogram(img);
	plot_histogram(img_hist);
	T = histogram_transform(img_hist);
	
	[row col] = size(img);
	I = zeros(row,col);
    I = uint8(I);
	for i =1:row
		for j =1:col
            %disp(img(i,j));
			I(i,j) = uint8(T(img(i,j)+1));
		end
	end
	figure;
	imshow(I);
	
	C = compute_histogram(I);
	plot_histogram(C); 
	
    
	%Still gotta compute mean and SD of old and new image
    
end
