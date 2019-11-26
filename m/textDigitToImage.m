function [pixels] = textDigitToImage(num, fontName)
    fonts = listfonts;
    
    avail = strcmp(fontName, fonts);
    if ~any(avail)
        error('Requested font %s not available\n', fontName);
    end
    
    %Make a figure, but don't show it
    f = figure('Name', 'Digit', 'visible', 'off');    
    a1 = axes( 'Parent', f, 'box', 'off', 'units', 'pixels', 'position', [0 0 27 27]);
    mytext = text(a1,8,12,num2str(num),'fontsize',20,'fontunits','pixels','unit','pixels','fontname',fontName);
    cData = print('-RGBImage','-r0'); %Make a big image with the digit
    iGray = rgb2gray(cData); %Convert the image to grayscale
    
    pixels = iGray(end-26:end,1:27); %Crop the digit at bottom-left of the image
    rng('shuffle');
    noise = uint8(sqrt(double(pixels)).*randn(27,27));
    pixels = pixels - noise;
    pixels = 255 - pixels; %invert the grayscale values
    
    close(f); 
end