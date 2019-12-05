function [classifications] = avrgClassifier(toClassify, classAvrgs)
    numToTest = size(toClassify, 2);
    numClasses = size(classAvrgs, 2);
    classifications = zeros(numClasses,0); %Make a classifications indicator matrix
    
    %For each test, find the closest match, set it as the classification
    for i = 1:numToTest
        digitToClassify = toClassify(:,i); %Get the digit we want to classify
        
        dists = zeros(numClasses,1,'double'); %Setup a distances vector
        %For each classification, calculate the distance from the digit
        for j = 1:numClasses
            dists(j) = norm(classAvrgs(:,j)-digitToClassify); %Calculate the 'distance' in the images
        end
        
        %Get the index with the lowest error
        lowestErr = min(dists);
        lowestErrIdx = find(dists==lowestErr);
                
        %Use that lowest error as the classification
        indicator = zeros(numClasses,1,'double');
        indicator(lowestErrIdx,1) = 1.0;
        
        %Append the indicator vector to the matrix
        classifications = [classifications, indicator];
    end
end

