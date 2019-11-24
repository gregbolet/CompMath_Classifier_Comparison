function [means]= getMnistMeans(mnistfile)
    %This function is designed to take a file input and should return a
    %structure array containing the mnist mean for each digit.
    mnist= load(mnistfile);

    for i= 0:9
        %Get mean of all i digits from Mnist
        mnistDigit= mean(mnist.(strcat('train', int2str(i))));

        %Shape the image vector into a matrix.
        digitImage= reshape(mnistDigit,28,28);

        %Correct matrix orientation
        flipped= rot90(flipud(digitImage),-1);

        %Set field structure based on data.
        fieldname= strcat('trainMean', int2str(i));
        means.(fieldname)= nan;
        means= setfield(means,fieldname,flipped);
    end

end