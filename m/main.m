mnistFile = '../datasets/mnist_all.mat';

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

avg = avrgInputDigits(mnistInputMat, mnistTargetMat);
plotDigit(reshape(avg(:,4),28,28));

avg = avrgInputDigits(fontGenInputMat, fontGenTargetMat);
plotDigit(reshape(avg(:,4),28,28));



