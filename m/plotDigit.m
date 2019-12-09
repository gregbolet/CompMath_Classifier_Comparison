function [f]= plotDigit(digit)
    f = figure('Name', 'DigitPlot');
    img= image(reshape(digit, 28, 28));
    colormap(gray(256)), axis square tight on;
end