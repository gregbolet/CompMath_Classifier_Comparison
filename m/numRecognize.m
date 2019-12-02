function [recognizeNum]= numRecognize()
%Create a 1x10 matrix with all zeroes except for 1 column which contains a
%1. For example, for the number zeros, it will be all zeros except for the
%first column which is a 1. The number 1 will have a 1 on the second column
%and so forth until the number 9.
numRecognize= zeros(1,10);
    for i= 1:10
    numRecognize(:,i)= numRecognize(:,i)+1;
    
    fieldname= strcat('Number', int2str(i-1));
    recognizeNum.fieldname=nan;
    recognizeNum= setfield(recognizeNum,fieldname,numRecognize);
    
    numRecognize=zeros(1,10);
    end
    
end