mnistFile = '../datasets/mnist_all.mat';

close all;

load('../datasets/mnistInputData.mat');
load('../datasets/mnistTargetData.mat');
sampleInputData(mnistInputMat);
mnistInputMat = double(mnistInputMat);

load('../datasets/fontGenInputData.mat');
load('../datasets/fontGenTargetData.mat');
sampleInputData(fontGenInputMat);
fontGenInputMat = double(fontGenInputMat);
fontGenTargetMat = double(fontGenTargetMat);





