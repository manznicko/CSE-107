clear
clc
close all
% Test script

A = imread("watertower.tif");
figure("Name", "watertower.tif");
imshow(A);
sobel_x= [1 ,0 ,-1; 2,0,-2; 1, 0 ,-1];
sobel_y= [1,2,1; 0,0, 0; -1, -2 ,-1];

% out = spatial_filter(A, sobel_x);

edges = find_edges(A, 200);

figure("Name", "Edges Detected");
imshow(edges);
imwrite(edges, "watertower_edges.png");

Canny = edge(A, 'canny');
figure("Name", "Canny Edge Detection");
imshow(Canny);
imwrite(Canny, "Canny Edge Detection.png");