function [trainMat, trainMatInd, testMat, testMatInd] = genTrainTest(inputMat, targetMat)
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
        digitRanges = [digitRanges, idx-1];
    end
    
    %% Find the biggest and smallest ranges of digit samples provided
     digitRangesLen = size(digitRanges, 2);
%     biggestDiff = 0;
%     smallestDiff = numSamples;
%     for i = 1:digitRangesLen-1
%         diffVal = digitRanges(1, i+1) - digitRanges(1,i);
%         if(diffVal > biggestDiff)
%             biggestDiff = diffVal;
%         end
%         if(diffVal < smallestDiff)
%             smallestDiff = diffVal;
%         end
%     end
    
    %% Build the training and testing datasets
    trainMat = zeros(numFeats, 0);
    testMat  = zeros(numFeats, 0);
    trainMatInd = zeros(10, 0);
    testMatInd  = zeros(10, 0);
    
    %selToTrain = zeros(10, biggestDiff);
    %selToTest  = zeros(10, numSamples - smallestDiff);
    
    for i = 1:digitRangesLen-1
        startIdx = digitRanges(1,i);
        endIdx = digitRanges(1,i+1);
        diffVal = endIdx - startIdx;
        toTrainIdxs = datasample(startIdx:endIdx-1, floor(diffVal*0.9), 'Replace', false);
        toTestIdxs  = setdiff(startIdx:endIdx-1, toTrainIdxs);
        
        numToTrain = size(toTrainIdxs, 2);
        numToTest  = size(toTestIdxs , 2);
        
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