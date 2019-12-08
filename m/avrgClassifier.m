function [classDists] = avrgClassifier(toClassify, classAvrgs)
    numToTest = size(toClassify, 2);
    numClasses = size(classAvrgs, 2);
    classDists = zeros(numClasses,0); %Make a classifications distribution matrix
    
    %For each test, find the closest match, set it as the classification
    for i = 1:numToTest
        digitToClassify = toClassify(:,i); %Get the digit we want to classify
        
        dists = zeros(numClasses,1,'double'); %Setup a distances vector
        %For each classification, calculate the distance from the digit
        for j = 1:numClasses
            dists(j) = norm(classAvrgs(:,j)-digitToClassify); %Calculate the 'distance' in the images
        end
        
        %Get the biggest distance, we will give it probability of 0
        maxDist = max(dists);
        
        %Make the smallest distance the largest value
        dists = maxDist - dists;
        
        %Normalize the distances with weighted sum
        totalSum = sum(dists);
        normDists = dists./totalSum;
        
        %Append distances to matrix
        classDists = [classDists, normDists];
    end
end

