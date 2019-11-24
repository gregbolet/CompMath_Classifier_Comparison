meanStruct= getMnistMeans('../datasets/mnist_all.mat');
for i= 0:9
    fieldname= strcat('trainMean', int2str(i));
    digit=meanStruct.(fieldname);
    figure;
    plotDigit(digit);
end