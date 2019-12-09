function [] = runTestsForAvrgCl()
    % Pull in the data for comparisons
    load('../datasets/HWData.mat');
    load('../datasets/FGData.mat');
    load('../datasets/HWFGData.mat');
    
    fnct = @avrgClassifier;
    tag  = 'AVRG ';
    
    % Calculate the image averages
    avrgsHW   = avrgInputDigits(trainHW,   trainHWTargets);
    avrgsFG   = avrgInputDigits(trainFG,   trainFGTargets);
    avrgsHWFG = avrgInputDigits(trainHWFG, trainHWFGTargets);

%     plotAvrgdDigits(avrgsHW);
%     plotAvrgdDigits(avrgsFG);
%     plotAvrgdDigits(avrgsHWFG);
%     plotAvrgdDigits(avrgsHWFG - avrgsHW);
    
    %% Train: HW, Test: HW
    makeConfMatrix(fnct, testHW, ... 
                   testHWTargets, [tag, 'HW -- HW'], avrgsHW);

    % Train: HW, Test: FG
    makeConfMatrix(fnct, testFG, ... 
                   testFGTargets, [tag, 'HW -- FG'], avrgsHW);
               
    % Train: HW, Test: HW+FG
    makeConfMatrix(fnct, testHWFG, ... 
                   testHWFGTargets, [tag, 'HW -- HW+FG'], avrgsHW);
               
    %% Train: FG, Test: HW
    makeConfMatrix(fnct, testHW, ... 
                   testHWTargets, [tag, 'FG -- HW'], avrgsFG);

    % Train: FG, Test: FG
    makeConfMatrix(fnct, testFG, ... 
                   testFGTargets, [tag, 'FG -- FG'], avrgsFG);
               
    % Train: FG, Test: HW+FG
    makeConfMatrix(fnct, testHWFG, ... 
                   testHWFGTargets, [tag, 'FG -- HW+FG'], avrgsFG);
               
    %% Train: HW+FG, Test: HW
    makeConfMatrix(fnct, testHW, ... 
                   testHWTargets, [tag, 'HW+FG -- HW'], avrgsHWFG);

    % Train: HW+FG, Test: FG
    makeConfMatrix(fnct, testFG, ... 
                   testFGTargets, [tag, 'HW+FG -- FG'], avrgsHWFG);
               
    % Train: HW+FG, Test: HW+FG
    makeConfMatrix(fnct, testHWFG, ... 
                   testHWFGTargets, [tag, 'HW+FG -- HW+FG'], avrgsHWFG);
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






