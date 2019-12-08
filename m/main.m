close all;

load('../datasets/mnistTrainData.mat');
load('../datasets/fontGenTrainData.mat');

load('../datasets/mnistTestData.mat');
load('../datasets/fontGenTestData.mat');

%load('../datasets/mnistData.mat');
%load('../datasets/fontGenData.mat');

avrgsMnist   = avrgInputDigits(mnistInputTrain,   mnistTargetTrain);
avrgsFontGen = avrgInputDigits(fontGenInputTrain, fontGenTargetTrain);

%res = avrgClassifier(mnistInputTest, avrgsMnist);
%resConf = figure, plotconfusion(mnistTargetTest, res, 'Testing MNIST');
%set(findobj(resConf,'type','text'),'fontsize',8)

res = avrgClassifier(fontGenInputTest, avrgsFontGen);
resConf = figure, plotconfusion(fontGenTargetTest, res, 'Testing FONTGEN');
set(findobj(resConf,'type','text'),'fontsize',8)

% myNNFnct = makeNN(mnistInputTrain, mnistTargetTrain, 28);

% res = myNNFnct(mnistInputTest);
% resConf = figure, plotconfusion(mnistTargetTest, res, 'Testing MNIST');
% set(findobj(resConf,'type','text'),'fontsize',8)

%plotDigit(reshape(mnistInputTest(:,4),28,28));

% [fontGenInputTrain, fontGenTargetTrain, ... 
%  fontGenInputTest, fontGenTargetTest] ... 
%  = genTrainTestSets(fontGenInputMat, fontGenTargetMat, 0.45, 0.05);
% 
% [mnistInputTrain, mnistTargetTrain, ... 
%  mnistInputTest, mnistTargetTest] ... 
%  = genTrainTestSets(mnistInputMat, mnistTargetMat, 0.45, 0.05);
% 
% mnistFontGenInputTrain  = [mnistInputTrain,  fontGenInputTrain];
% mnistFontGenTargetTrain = [mnistTargetTrain, fontGenTargetTrain];
% mnistFontGenInputTest   = [mnistInputTest,   fontGenInputTest];
% mnistFontGenTargetTest  = [mnistTargetTest,  fontGenTargetTest];
% 
% save('../datasets/mnistFontGenData.mat', ... 
%      'mnistFontGenInputTrain', 'mnistFontGenTargetTrain', ...
%      'mnistFontGenInputTest',  'mnistFontGenTargetTest');




