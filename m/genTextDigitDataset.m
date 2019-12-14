function [] = genTextDigitDataset(fontName)

    fontGenInputMat= zeros(784,0,'double');% Matrix containing entire data set
    fontGenTargetMat= zeros(10,0,'double');% Indicator matrix containing input classifications
    
    %Generate images for 0 thourgh 9
    for i = 0:9
        %Generate 7000 samples for each digit
        for j = 1:7000
            pixels = textDigitToImage(i, fontName);
            imageVec = reshape(pixels, 1, 784)';
            fontGenInputMat = [fontGenInputMat, imageVec];
            
            targetVec= zeros(10,1, 'double'); %Make target column vector
            targetVec(i+1,1)= 1.0; %Set indicator for digit classification
            fontGenTargetMat= [fontGenTargetMat, targetVec]; %Append columnwise to output matrix
        end
    end
    
    %Export both of out files to the dataset directory
    save('../datasets/fontGenData.mat','fontGenInputMat', 'fontGenTargetMat');
end