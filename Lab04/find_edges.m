function [edges] = find_edges(inp, t)
% FIND EDGES Summar of function goes here:
[M,N] = size(inp);
edges = zeros(M,N);

g = gradient_magnitude(inp);

% % threshold here
% From pdf: value 255 where edges are detected and 0 elsewhere
% edges = %
for m=1:M
    for n=1:N
        if(g(m,n) > t)
            edges(m,n) = 255;
        else
            edges(m,n) = 0;
        end
    end
end

edges = uint8(edges);
end