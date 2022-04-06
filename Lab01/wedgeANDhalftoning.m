A = uint8(ones(256,256));

for i=1:256
    for j=1:256
        A(i,j)= i;
    end
end

% disp(A)
figure();
imshow(A);
imwrite(A, 'wedge.png');

halfWEDGE = halftone(A);
figure();
imshow(halfWEDGE);
imwrite(halfWEDGE, 'wedge_OUT.png');



% Display a grayscale image 
I = imread('Fig0225(b)(cameraman).tif');
O = halftone(I);
figure();
imshow(O);
imwrite(O,'Fig0225(b)(cameraman)OUT.png');


W = imread('Fig0225(a)(face).tif');
E = halftone(W);
figure();
imshow(E);
imwrite(E, 'Fig0225(a)(face)OUT.png');


C = imread('Fig0225(c)(crowd).tif');
V = halftone(C);
figure();
imshow(V);
imwrite(V, 'Fig0225(c)(crowd)OUT.png');


B = imread('blinq-art-black-white-default.TIF');
N = halftone(B);
figure();
imshow(N);
imwrite(N,'blinq-art-black-white-default-OUT.TIF');

