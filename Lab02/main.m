clear all
clc
close all

A = imread("Lab_02_image1.tif");
B = myimresize(A, [45 70], 'nearest');
B1 = myimresize(B, [300 300], 'nearest');
C = myimresize(A, [45 70], 'bilinear'); 
C1 = myimresize(B, [300 300], 'bilinear');
F = myimresize(A, [425 600], 'nearest');
F1 = myimresize(F, [300 300], 'nearest');
G = myimresize(A, [425 600], 'bilinear');
G1 = myimresize(G, [300 300], 'bilinear');

D = imresize(A, [45 70], 'nearest', 'Antialiasing',false);
D1 = imresize(D, [300 300], 'nearest', 'Antialiasing',false);
E = imresize(A, [45 70], 'bilinear', 'Antialiasing',false);
E1 = imresize(E, [300 300], 'bilinear', 'Antialiasing',false);
H = imresize(A, [425 600], 'nearest','Antialiasing',false);
H1 = imresize(F, [300 300], 'nearest','Antialiasing',false);
I = imresize(A, [425 600], 'bilinear','Antialiasing',false);
I1 = imresize(G, [300 300], 'bilinear','Antialiasing',false);

% test = myimresize(A, [9000, 9000], 'nearest'); % test to see quality loss from a massive upsample
% figure
% imshow(test);
% test2 = myimresize(test, [200, 200],'nearest' );
% figure
% imshow(test2)
% TIGRE = imread("blinq-art-black-white-default.TIF");
% TIGER = myimresize(TIGRE, [3840, 2160], 'nearest');
% imwrite(TIGER, 'blinq-art-black-white-default4k.TIF');
% figure
% imshow(TIGER);
% figure
% imshow(TIGRE);

figure();
imshow(A);
figure
imshow(B);
figure
imshow(B1);
imwrite(B1, "QualityLossNearestNeigh.png");
figure
imshow(C);
figure
imshow(C1);
imwrite(C1, "MyDownUpBilinear.png");
figure
imshow(D);
figure
imshow(D1);
figure
imshow(E);
figure;
imshow(E1);
imwrite(E1,"ITSdownUpBilinear.png");
figure
imshow(F1);
imwrite(F1, "PerfectQualityKeptNearest.png");
figure
imshow(H1);
imwrite(B, "40 75 NN.png");
imwrite(C, "40 75 B.png");
imwrite(F, "425 600 NN.png");
imwrite(G, "425 600 B.png");
error_vals = zeros(4,2);

error_vals(1,1) = myRMSE(A, B1);
error_vals(2,1) = myRMSE(A, C1);
error_vals(1,2) = myRMSE(A, D1);
error_vals(2,2) = myRMSE(A, E1);

error_vals(3,1) = myRMSE(A, F1);
error_vals(4,1) = myRMSE(A, G1);
error_vals(3,2) = myRMSE(A, H1);
error_vals(4,2) = myRMSE(A, I1);

disp("The following is the RMSE value of myimresize()");
disp("next to the built in imresize() for every resized image.");
disp(error_vals);


% take original image downsample/upsample, then re up/down - sample the
% image back to it original


