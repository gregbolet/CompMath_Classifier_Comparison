mnistFile = '../datasets/mnist_all.mat';

meanStruct= getMnistMeans(mnistFile);
close all;

% for i= 0:9
%     fieldname= strcat('trainMean', int2str(i));
%     digit=meanStruct.(fieldname);
%     plotDigit(digit);
% end

%img1 = textDigitToImage(3, 'Courier');
%plotDigit(img1);  

%img2 = textDigitToImage(6, 'Courier');
%plotDigit(img2);

%genInputDataFromMnist(mnistFile);
genTextDigitDataset('Courier');