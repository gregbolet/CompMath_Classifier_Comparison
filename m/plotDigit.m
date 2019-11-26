function []= plotDigit(digit)
    figure;
    img= image(digit);
    colormap(gray(256)), axis square tight on;
end