function [avg]= avrgInputDigits(inputMat,targetMat)
    
    prevIdx=1; %Keep track of start of digit section
    idx=1; %Keep track of end of digit section
    avg= zeros(784,10); %Create empty output matrix
    
    for i= 0:9 %for each digit
        % find end index of digits
        while (idx <= size(targetMat,2)) && (targetMat(i+1,idx) == 1)
            idx= idx+1; 
        end
        %calculate columnwise mean
        imgMean= mean(inputMat(:,prevIdx:idx-1),2);
        prevIdx=idx; %Set the start of the next digit section
        avg(:, i+1)=imgMean; %Append image mean to empty output matrix
    end

end
