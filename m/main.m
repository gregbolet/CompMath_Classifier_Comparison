mnistFile = '../datasets/mnist_all.mat';

close all;

load('../datasets/mnistInputData.mat');
load('../datasets/mnistTargetData.mat');
%sampleInputData(mnistInputMat);

load('../datasets/fontGenInputData.mat');
load('../datasets/fontGenTargetData.mat');
sampleInputData(fontGenInputMat);

avg = avgInputDigit(fontGenInputMat, fontGenTargetMat);
plotDigit(reshape(avg(:,4),28,28));



