function [f]= plotDigit(digit)
    f = figure('Name', 'DigitPlot');
    img= image(digit);
    colormap(gray(256)), axis square tight on;
end