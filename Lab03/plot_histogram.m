function [hist] = plot_histogram(h)
%PLOT_HISTOGRAM Summary of this function goes here
%   Detailed explanation goes here
% 3/29
%    edges = linspace(0,1, 255);
   figure;
   hist = bar(h);
   xlabel('Intensity Values');
   ylabel("PMF");
   title("Histogram");
   grid on;
%    xlim([0,255]);
end

