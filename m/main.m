close all;

load('../datasets/mnistInputData.mat');
load('../datasets/mnistTargetData.mat');
load('../datasets/fontGenInputData.mat');
load('../datasets/fontGenTargetData.mat');

%sampleInputData(mnistInputMat);
mnistInputMat = double(mnistInputMat);
mnistTargetMat = double(mnistTargetMat);

%sampleInputData(fontGenInputMat);
fontGenInputMat = double(fontGenInputMat);
fontGenTargetMat = double(fontGenTargetMat);

avrgsMnist   = avrgInputDigits(mnistInputMat,   mnistTargetMat);
avrgsFontGen = avrgInputDigits(fontGenInputMat, fontGenTargetMat);

classifiedFonts = avrgClassifier(fontGenInputMat, avrgsMnist);

[a,b,c,d] = genTrainTest(mnistInputMat, mnistTargetMat);

