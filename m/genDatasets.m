function [] = genDatasets()
    
    % Load our datasets
    load('../datasets/mnistData.mat');
    load('../datasets/fontGenData.mat');

    %% Generate HW dataset
    [trainHW, trainHWTargets, testHW, testHWTargets] ... 
        = genTrainTestSets(mnistInputMat, mnistTargetMat, 0.9, 0.1);
    
    % Save the data bundle
    save('../datasets/HWData.mat', 'trainHW', 'trainHWTargets', ...
                                   'testHW',  'testHWTargets');
    
    %% Generate FG dataset
    [trainFG, trainFGTargets, testFG, testFGTargets] ... 
        = genTrainTestSets(fontGenInputMat, fontGenTargetMat, 0.9, 0.1);
    
    % Save the data bundle
    save('../datasets/FGData.mat', 'trainFG', 'trainFGTargets', ...
                                   'testFG',  'testFGTargets');
    
    %% Generate HW+FG dataset
    [trainHW, trainHWTargets, testHW, testHWTargets] ... 
        = genTrainTestSets(mnistInputMat, mnistTargetMat, 0.27, 0.05);
    
    [trainFG, trainFGTargets, testFG, testFGTargets] ... 
        = genTrainTestSets(fontGenInputMat, fontGenTargetMat, 0.63, 0.05);
    
    trainHWFG        = [trainHW, trainFG];
    trainHWFGTargets = [trainHWTargets, trainFGTargets];
    testHWFG         = [testHW, testFG];
    testHWFGTargets  = [testHWTargets, testFGTargets];
    
    % Save the data bundle
    save('../datasets/HWFGData.mat', 'trainHWFG', 'trainHWFGTargets', ...
                                     'testHWFG',  'testHWFGTargets');
end
