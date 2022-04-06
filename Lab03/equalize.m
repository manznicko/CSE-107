function [I] = equalize(img)
%EQUALIZE Summary of this function goes here
% 	This function takes in a greyscale image matrix and utilizes compute_histogram, plot_histogram, and histogram_transform
% 	order to create a new equalized image. Additionally, this function computes the mean and standard deviations of both the input
% 	and output images and prints the values to the terminal.

% Syntax:
% 	out = equalize(in);
% Input:
% 	in = the matrix of a greyscale image. It should be of type uint8 and have values that range from 0-255
% Output:
% 	out = the matrix the new equalized greyscale image. It should be of type uint8 and have values that range from 0-255
% History:
% 	4/5 Started writing the function. Implemented the call of histogram compute, plot, and transform
% 	4/6 Completed function after adding image mean/standard deviatians
	
	img_hist = compute_histogram(img);
	plot_histogram(img_hist);
	T = histogram_transform(img_hist);

    fprintf("The mean of input image: ")
    av = mean(img, "All")

    fprintf("The sd of input image: ")
    sd = mean(std(double(img)), "all")
	
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
    fprintf("The mean of equalized image: ")
    av = mean(I, "All")
    fprintf("The sd of equalized image: ")
    sd = mean(std(double(I)), "all")
	
	C = compute_histogram(I);
	plot_histogram(C); 
	
    
	%Still gotta compute mean and SD of old and new image
    
end

