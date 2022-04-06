function [y] = halftone(a)
%HALFTONE Summary of this function goes here
%function out = halftone(in) 
% halftone  Converts a grayscale image to a binary image by using binary dot patterns to 
%           render grayscale values. (more as appropriate). 
% 
% Syntax: 
%   out = halftone(in) 
% 
% Input: 
%   in = the grayscale image to be rendered. It should be of type uint8 and have values 
%        in the range 0-255. 
% 
% Output: 
%   out = the rendered binary image. It is of type uint8 and will have two values: 0 and 
%         255. 
% 
% History: 
%2/08 Started lab, set up halftone completed up to lines 22-40
%2/15 Completed the logic for halftoning, lines 41-55, attempted special cases
%2/22 Fixed/Completed Special Cases
A = double(a);
[row, col] = size(a);
y=uint8(a);

dots = uint8(zeros(3,3,10));
dots(:,:,1) = [0 0 0; 0 0 0; 0 0 0];
dots(:,:,2) = [0 255 0; 0 0 0; 0 0 0];
dots(:,:,3) = [0 255 0; 0 0 0; 0 0 255];
dots(:,:,4) = [255 255 0; 0 0 0; 0 0 255];
dots(:,:,5) = [255 255 0; 0 0 0; 255 0 255];
dots(:,:,6) = [255 255 255; 0 0 0; 255 0 255];
dots(:,:,7) = [255 255 255; 0 0 255; 255 0 255];
dots(:,:,8) = [255 255 255; 0 0 255; 255 255 255];
dots(:,:,9) = [255 255 255; 255 0 255; 255 255 255];
dots(:,:,10) = [255 255 255; 255 255 255; 255 255 255];

redge = mod(row,3);
cedge = mod(col,3);

for i=1:3:row-redge
    for j=1:3:col-cedge
		avg = mean(mean(A(i:i+2, j:j+2))); %3x3 patch
		
		dI = floor((avg/255)*10)+1; %dotIndex for block
        if dI>10
            dI =10;
        end
		
		y(i:i+2,j:j+2) = dots(:,:,dI);
		
		
    end
end

%SPECIAL EDGE CASES attempt 1
% fprintf("Now starting special cases");
% for k=row-redge:redge:row
%     for l=col-cedge:cedge:col
% %         disp(k);
% %         disp(k+redge);
%         disp(l);
%         disp(l+cedge);
%         avg = mean(mean(A(k:end, l:l+cedge)));
%         dI = floor((avg/255)*10);
%         if dI == 10
%             dI = 9;
%         end
%         y(k:k+redge,l:l+cedge) = dots(1:redge,1:cedge,dI);
%     end
% end

% SPECIAL EDGE CASE ATTEMPT 2

% if redge ~= 0
%     l = col-cedge;
%     for k=row-redge:redge:row
%         disp(k+redge)
%         avg = mean(mean(A(k:k+redge-1, l:l+cedge)));
%         dI = floor((avg/255)*10);
%         y(k:k+redge,l:l+cedge) = dots(1:redge,1:cedge,dI);
%     end
% end
% 
% if cedge ~= 0
%     k = row-redge;
%     for l = col-cedge:cedge:col
%         avg = mean(mean(A(k:k+redge, l:l+cedge-1)));
%         dI = floor((avg/255)*10);
%         y(k:k+redge,l:l+cedge) = dots(1:redge,1:cedge,dI);
%     end
% end

%attempt 3
if redge>0
    for i=1:3:col-cedge
        avg = mean(mean(A(row-redge+1:row, i:i+2)));
        dI = floor((avg/255)*10);
        if dI == 10
            dI=9;
        end
        y(row-redge+1:row,i:i+2) = dots(1:redge,:,dI+1);
    end
    if cedge>0
        avg = mean(mean(A(row-redge+1:row, col-cedge+1:col)));
        dI = floor((avg/255)*10);
        if dI == 10
            dI=9;
        end
        y(row-redge+1:row,col-cedge+1:col) = dots(1:redge,1:cedge, dI+1);
    end
end


% Determine the size of the input image
% allocate output image
% allocae the 3 dimensional data structure for storing dot patterns
% initialie the dot patterns
% loop through the input image doing the following
%     compute average over a given 3x3 pixel block
%     use this average value to copy the appropriate dot pattern to output image
% take care of special cases when block is not a multiple of 3


