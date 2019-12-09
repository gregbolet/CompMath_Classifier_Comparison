function [resConf] = makeConfMatrix(clFnct, input, targets, title, varargin)
    
    if nargin == 5
        res = clFnct(input, varargin{1}); %If we get a call for avrgCl
    else
        res = clFnct(input); %Otherwise assume it's a NN classif. call
    end
    
    %Set the resulting confusion matrix
    resConf = figure; 
    plotconfusion(targets, res, title);
    set(findobj(resConf,'type','text'),'fontsize',8); %Change font size
    set(gca, 'XTickLabel', {0:9, []}) %Correct X/Y labels
    set(gca, 'YTickLabel', {0:9, []})

end