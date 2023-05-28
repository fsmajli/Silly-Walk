function [layers, options] = specify_network()
% Your code here
inputSize = 3;
numHiddenUnits = 15;
numClasses = 2;

layers = [...
    sequenceInputLayer(inputSize)
    %%lstmLayer(numHiddenUnits,'OutputMode', 'last')
    %%bilstmLayer(numHiddenUnits,'OutputMode', 'last')
    gruLayer(numHiddenUnits,'OutputMode', 'last')
    dropoutLayer(0.5)
    reluLayer
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];


maxEpochs = 100;
miniBatchSize = 8;
%'Plots','training-progress',...
options = trainingOptions('adam', ...
    'MaxEpochs', maxEpochs, ...
    'MiniBatchSize', miniBatchSize, ...
    'Verbose', false, ...
    'Plots','none',...
    'shuffle','every-epoch',...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropFactor',0.9,...
    'LearnRateDropPeriod',5);
end
