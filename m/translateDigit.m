function[]= translateDigit(digit,xOffset)
    numRows= 28; %Hard coded values for the number of rows and digits
    numCols= 28;

    % Initialize a for loop that starts from the end of the column vector and
    % iterates backwards
    for i= numCols: -1: xOffset+1
        startIdxTo=((i-1)*numRows)+1; %Find the starting index for vectors that will be changed 
        endIdxTo= startIdxTo+numRows-1; %Find the end index for vectors that will be changed
        startIdxFrom= startIdxTo - (xOffset* numRows); %Find the starting index for the vector values that will replace our old ones
        endIdxFrom= endIdxTo - (xOffset*numRows);%Find the ending index for the vector values that will replace our old ones.
        digit(startIdxTo:endIdxTo,1)= digit(startIdxFrom:endIdxFrom,1); %Replace old digit values with translated digits.
    end

    startIdx= 1; %Create a new starting index
    endIdx= xOffset*numRows; %Create a new ending index
    digit(startIdx:endIdx,1)=0; %Change all values before the offset column vector to columns of zero.

    plotDigit(reshape(digit(:,1),28,28)); %Plot the translated digit.
end