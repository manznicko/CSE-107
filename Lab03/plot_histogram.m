function [hist] = plot_histogram(h)
%PLOT_HISTOGRAM Summary of this function goes here:
% %   Takes in a histogram vector of normalized values and plots the given vector 
% Syntax:
%    plot_histogram(in);
%    out = plot_histogram(in);

% Input:
%    in = a vector of normalized histogram values

% Output:
%    out = the figure or created histogram bar graph

% History:
%  3/29 - started/completed function implementation 


%    edges = linspace(0,1, 255);
   figure;
   hist = bar(h);
   xlabel('Intensity Values');
   ylabel("PMF");
   title("Histogram");
   grid on;
%    xlim([0,255]);
end

