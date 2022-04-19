function [mat] = spatial_filter(inp, sobel)
%SPATIAL FILTER Summary of this function goes here:
[row, col] = size(inp);
[R,S] = size(sobel);
mat = double(zeros(row,col));
pad = (R-1)/2;
pad_input = double(zeros(2*pad+row, 2*pad+col));

% copy matrix over
for i=1:row
    for j=1:col
        pad_input(i+pad,j+pad) = inp(i,j);
    end
end



for m=1:row
    for n=1:col
        for s=1:R
            for t=1:S
                display(m,n,s,t,m+s,n+t);
                mat(m,n) = m(m,n) + sobel(s,t)*pad_input(m+s-1,n+t-1);
            end
        end
    end
end

end