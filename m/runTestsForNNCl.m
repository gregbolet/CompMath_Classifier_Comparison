function [] = runTestsForNNCl()
    % Pull in the data for comparisons
    load('../datasets/HWData.mat');
    load('../datasets/FGData.mat');
    load('../datasets/HWFGData.mat');
    
    tag = 'NN ';
        
    %% Make each NN and get their function pointers
    nnHW   = makeNN(trainHW,   trainHWTargets,   28, 'hwNNFnct');
    nnFG   = makeNN(trainFG,   trainFGTargets,   28, 'fgNNFnct');
    nnHWFG = makeNN(trainHWFG, trainHWFGTargets, 28, 'hwfgNNFnct');
    
    %% Train: HW, Test: HW
    makeConfMatrix(nnHW, testHW, ... 
                   testHWTargets, [tag, 'HW -- HW']);

    % Train: HW, Test: FG
    makeConfMatrix(nnHW, testFG, ... 
                   testFGTargets, [tag, 'HW -- FG']);
               
    % Train: HW, Test: HW+FG
    makeConfMatrix(nnHW, testHWFG, ... 
                   testHWFGTargets, [tag, 'HW -- HW+FG']);
               
    %% Train: FG, Test: HW
    makeConfMatrix(nnFG, testHW, ... 
                   testHWTargets, [tag, 'FG -- HW']);

    % Train: FG, Test: FG
    makeConfMatrix(nnFG, testFG, ... 
                   testFGTargets, [tag, 'FG -- FG']);
               
    % Train: FG, Test: HW+FG
    makeConfMatrix(nnFG, testHWFG, ... 
                   testHWFGTargets, [tag, 'FG -- HW+FG']);
               
    %% Train: HW+FG, Test: HW
    makeConfMatrix(nnHWFG, testHW, ... 
                   testHWTargets, [tag, 'HW+FG -- HW']);

    % Train: HW+FG, Test: FG
    makeConfMatrix(nnHWFG, testFG, ... 
                   testFGTargets, [tag, 'HW+FG -- FG']);
               
    % Train: HW+FG, Test: HW+FG
    makeConfMatrix(nnHWFG, testHWFG, ... 
                   testHWFGTargets, [tag, 'HW+FG -- HW+FG']);
end






