close all;

load('../datasets/mnistInputData.mat');
load('../datasets/mnistTargetData.mat');
%sampleInputData(mnistInputMat);
mnistInputMat = double(mnistInputMat);
mnistTargetMat = double(mnistTargetMat);

load('../datasets/fontGenInputData.mat');
load('../datasets/fontGenTargetData.mat');
%sampleInputData(fontGenInputMat);
fontGenInputMat = double(fontGenInputMat);
fontGenTargetMat = double(fontGenTargetMat);

avrgsMnist   = avrgInputDigits(mnistInputMat,   mnistTargetMat);
avrgsFontGen = avrgInputDigits(fontGenInputMat, fontGenTargetMat);

classifiedFontGen = avrgClassifier(fontGenInputMat, avrgsMnist);

