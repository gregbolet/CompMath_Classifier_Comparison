function [] = runTestsForAvrgCl()
    %Pull in the data for comparisons
    load('../datasets/HWData.mat');
    load('../datasets/FGData.mat');
    load('../datasets/HWFGData.mat');
    
    %Calculate the image averages
    avrgsHW   = avrgInputDigits(trainHW,   trainHWTargets);
    avrgsFG   = avrgInputDigits(trainFG,   trainFGTargets);
    avrgsHWFG = avrgInputDigits(trainHWFG, trainHWFGTargets);

    plotAvrgdDigits(avrgsHW);
    plotAvrgdDigits(avrgsFG);
    plotAvrgdDigits(avrgsHWFG);
    plotAvrgdDigits(avrgsHWFG - avrgsHW);
    
    %% Train: HW, Test: HW
    makeConfMatrix(@avrgClassifier, testHW, ... 
                   testHWTargets, 'HW -- HW', avrgsHW);

    % Train: HW, Test: FG
    makeConfMatrix(@avrgClassifier, testFG, ... 
                   testFGTargets, 'HW -- FG', avrgsHW);
               
    % Train: HW, Test: HW+FG
    makeConfMatrix(@avrgClassifier, testHWFG, ... 
                   testHWFGTargets, 'HW -- HW+FG', avrgsHW);
               
    %% Train: FG, Test: HW
    makeConfMatrix(@avrgClassifier, testHW, ... 
                   testHWTargets, 'FG -- HW', avrgsFG);

    % Train: FG, Test: FG
    makeConfMatrix(@avrgClassifier, testFG, ... 
                   testFGTargets, 'FG -- FG', avrgsFG);
               
    % Train: FG, Test: HW+FG
    makeConfMatrix(@avrgClassifier, testHWFG, ... 
                   testHWFGTargets, 'FG -- HW+FG', avrgsFG);
               
    %% Train: HW+FG, Test: HW
    makeConfMatrix(@avrgClassifier, testHW, ... 
                   testHWTargets, 'HW+FG -- HW', avrgsHWFG);

    % Train: HW+FG, Test: FG
    makeConfMatrix(@avrgClassifier, testFG, ... 
                   testFGTargets, 'HW+FG -- FG', avrgsHWFG);
               
    % Train: HW+FG, Test: HW+FG
    makeConfMatrix(@avrgClassifier, testHWFG, ... 
                   testHWFGTargets, 'HW+FG -- HW+FG', avrgsHWFG);
end

function [] = plotAvrgdDigits(avrgdDigits)
    numDigits = size(avrgdDigits, 2);
    figure;
    
    for i = 1:numDigits
        digit = reshape(avrgdDigits(:,i),28,28);
        subplot(2,5, i);
        img= image(digit);
        %colormap(gray(256)); %Remove the colormap to see differences
        axis square tight on;
        set(gca, 'XTickLabel', [])
        set(gca, 'YTickLabel', [])
    end

end






