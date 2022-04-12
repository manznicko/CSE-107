clear
clc
close all

A = imread("watertower.tif");
figure("Name", "watertower.tif");
imshow(A);
sobel_x= [1 ,0 ,-1; 2,0,-2; 1, 0 ,-1];
sobel_y= [1,2,1; 0,0, 0; -1, -2 ,-1];
