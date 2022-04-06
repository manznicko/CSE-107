clear all
clc
close all

A = imread("Lab_02_image1.tif");
B = myimresize(A, [19999 19999], 'bilinear');
B1 = myimresize(B, [300 300], 'bilinear');
C1 = imresize(A, [19999 19999], 'bilinear', 'Antialiasing',false);
C = imresize(C1, [300 300], 'bilinear', 'Antialiasing',false);

figure;
imshow(B1);
% 
figure()
imshow(C);
testE = zero(1,2);
testE(1,1) = myRMSE(A, B1);
testE(1,2) = myRMSE(A,C); 

% x = [4,10; 4,11;5,10;5,11]
% y = [100;107;120;130]
% p = [4.3,10.4]
% 
% tst = mybilinear(x,y,p);