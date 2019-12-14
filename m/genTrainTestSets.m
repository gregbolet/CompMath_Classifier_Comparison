function [trainMat, trainMatInd, testMat, testMatInd] ... 
         = genTrainTestSetsMixed(inputMat, targetMat, percTrain, percTest)
     
    [numDigits, numSamples] = size(targetMat);
    [numFeats, numSamples] = size(inputMat);
    digitRanges = zeros(1,0);
    digitRanges = [digitRanges, 1];
    
    %% Calculate ranges of digits
    idx = 1;
    for i = 0:numDigits-1
        while (idx <= numSamples) && (targetMat(i+1,idx) == 1)
            idx= idx+1; 
        end
        digitRanges = [digitRanges, idx];
    end
    
    %% Find the biggest and smallest ranges of digit samples provided
    digitRangesLen = size(digitRanges, 2);
    
    %% Build the training and testing datasets
    trainMat = zeros(numFeats, 0);
    testMat  = zeros(numFeats, 0);
    trainMatInd = zeros(10, 0);
    testMatInd  = zeros(10, 0);
    
    %selToTrain = zeros(10, biggestDiff);
    %selToTest  = zeros(10, numSamples - smallestDiff);
    
    for i = 1:digitRangesLen-1
        startIdx = digitRanges(1,i);
        endIdx = digitRanges(1,i+1)-1;
        diffVal = endIdx - startIdx;
        numToTrain = floor(percTrain * diffVal); %Rounding error occurs here...
        numToTest  = floor(percTest  * diffVal); %Rounding error occurs here...
        
        toTrainIdxs = datasample(startIdx:endIdx, numToTrain, 'Replace', false);
        leftover    = setdiff(startIdx:endIdx, toTrainIdxs);
        toTestIdxs  = datasample(leftover, numToTest, 'Replace', false);
        
        %fprintf('DiffValue: %d\n', diffVal);
        
        %numToTrain = size(toTrainIdxs, 2);
        %numToTest  = size(toTestIdxs , 2);
        
        %selToTrain(i, 1:numToTrain) = toTrainIdxs;
        %selToTest (i, 1:numToTest)  = toTestIdxs;
        
        for j = 1:numToTrain
            colIdx = toTrainIdxs(1,j);
            digit = inputMat(:, colIdx);
            trainMat = [trainMat, digit];
            indVec = zeros(10, 1);
            indVec(i, 1) = 1;
            trainMatInd = [trainMatInd, indVec];
        end
        
        for j = 1:numToTest
            colIdx = toTestIdxs(1,j);
            digit = inputMat(:, colIdx);
            testMat = [testMat, digit];
            indVec = zeros(10, 1);
            indVec(i, 1) = 1;
            testMatInd = [testMatInd, indVec];
        end
    end
    
    
    
end
