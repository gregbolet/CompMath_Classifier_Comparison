function [pixels] = textDigitToImage(num, fontName)
    fonts = listfonts;
    
    %Check that we have the requested font
    avail = strcmp(fontName, fonts);
    if ~any(avail)
        error('Requested font %s not available\n', fontName);
    end
    
    %Make a figure, but don't show it
    f = figure('Name', 'Digit', 'visible', 'off');    
    a1 = axes( 'Parent', f, 'box', 'off', 'units', 'pixels', 'position', [0 0 28 28]);
    text(a1,8,12,num2str(num),'fontsize',20,'fontunits','pixels','unit','pixels','fontname',fontName);
    F = getframe(f); 
    [cData, Map] = frame2im(F);
    %figure; image(cData); %Comment back in to view intermediary results
    iGray = rgb2gray(cData); %Convert the image to grayscale
    pixels = iGray(end-27:end,1:28); %Crop the digit at bottom-left of the image
    
    %Add random pixel noise to the image
    rng('shuffle');
    noise = uint8(sqrt(double(pixels)).*randn(28,28));
    pixels = pixels - noise;
    pixels = 255 - pixels; %invert and return the grayscale values
    
    close(f); 
end