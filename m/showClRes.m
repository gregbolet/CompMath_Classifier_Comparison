function [] = showClRes(digit, scores)
          
    %Now display the information we just calculated
    predictFig = figure;
    
    %Show the digit to estimate
    subplot(2,1,1); plotDigit(digit); 
    title(strcat('Test digit'));
    
    %Make the middle plot
    subplot(2,1,2); bar(scores);
    axis square; title({'Classification probability'});
    xlabel('digits compared'); ylabel('distance');
    %Manually set the x-axis values
    xticklabels({'0','1','2','3','4','5','6','7','8','9'}); ylim([0,1]);
    
    %Position the figure nicely, make it big enough to avoid text overlap
    figPos = get(predictFig, 'Position');
    figPos(1) = figPos(1) - 300; figPos(3) = figPos(3) + 300;
    set(predictFig, 'Position',  figPos); movegui(predictFig, 'center');
    
end

function [] = plotDigit(digit)
    digitImage = reshape(digit, 28, 28);
    image(reshape(digit, 28, 28));
    colormap(gray(256)), axis square tight on;
end