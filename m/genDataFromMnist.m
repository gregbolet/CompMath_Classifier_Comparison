function []= genDataFromMnist()

 mnist= load('../datasets/mnist_all.mat');

 mnistInputMat= zeros(784,0,'double');% Matrix containing entire data set
 mnistTargetMat= zeros(10,0,'double');% Indicator matrix containing input classifications
 
 % Go through mnist training and test matrices
    for i= 0:9
        %Get mean of all i digits from Mnist
        trainDigits= mnist.(strcat('train', int2str(i)));
        testDigits= mnist.(strcat('test', int2str(i)));
        allDigits= [trainDigits;testDigits];
        
        for j= 1:size(allDigits,1)
            digitData=allDigits(j,:)'; %Extract row
            
            %Shape the image vector into a matrix.
            digitImage= reshape(digitData,28,28);

            %Correct matrix orientation
            flipped= rot90(flipud(digitImage),-1);
                        
            %Convert image to vector(as column vector)
            imageVec=reshape(flipped,1,784)';
            mnistInputMat=[mnistInputMat, imageVec];
            
            targetVec= zeros(10,1, 'double'); %Make target column vector
            targetVec(i+1,1)= 1.0; %Set indicator for digit classification
            mnistTargetMat= [mnistTargetMat, targetVec]; %Append columnwise to output matrix
        end

    end
    
    %Export both of out files to the dataset directory
    save('../datasets/mnistData.mat','mnistInputMat', 'mnistTargetMat');    
end