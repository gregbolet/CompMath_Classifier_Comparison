function[]= sampleMnistInputData(inputMat)

    numCols= size(inputMat,2); % Get the number of columns from input file
    randCol= randi(numCols,1,1); % Randomly choose a number from 1 to the number of columns in input file

    inputDigit= inputMat(:,randCol); % Select a column based on randomly generated number
    digitImage= reshape(inputDigit,28,28)'; %Transpose the reshapen data. 

    plotDigit(digitImage); %Call the plotDigit function to plot the digit

end