clear all
clc
close all

A = imread("Lab_03_image1_dark.tif");
L = imread("Lab_03_image2_light.tif");

figure();
imshow(A);
newnew = equalize(A);

% figure();
% imshow(L);
% newt = equalize(L);

% B = compute_histogram(A); %Is the hist vector
% M = compute_histogram(L);

% sum = 0;
% for i=1:256
%     sum = sum + B(i,1);
% end
% disp(sum)

% plot_histogram(B);
% plot_histogram(M);

% histogram_transform(B);
% histogram_transform(M);