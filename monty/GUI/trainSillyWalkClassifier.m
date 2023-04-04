function [model,info] = trainSillyWalkClassifier(XTrain, YTrain)
% For this trivial example, no model is required. 
[layers, options] = specify_network();
[model,info] = trainNetwork(XTrain, YTrain, layers, options);


save(fullfile(fileparts(mfilename('fullpath')), 'Model.mat'), 'model'); % do not change this line
end

