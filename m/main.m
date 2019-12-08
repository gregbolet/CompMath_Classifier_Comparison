close all;

load('../datasets/mnistTrainData.mat');
load('../datasets/fontGenTrainData.mat');

load('../datasets/mnistTestData.mat');
load('../datasets/fontGenTestData.mat');

%avrgsMnist   = avrgInputDigits(mnistInputTrain,   mnistTargetTrain);
%avrgsFontGen = avrgInputDigits(fontGenInputTrain, fontGenTargetTrain);

%classifiedMnist = avrgClassifier(mnistInputTest, avrgsMnist);

plotDigit(reshape(mnistInputTest(:,2500),28,28));
translateDigit(mnistInputTest(:,2500),7);

