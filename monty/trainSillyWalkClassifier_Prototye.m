addpath('ExampleData', 'TestData', 'TrainingData')

trainingDataDir = dir('TrainingData');
trainingFileNames = {trainingDataDir.name};
trainingFileNames = trainingFileNames(3:end);

testDataDir = dir('TestData');
testFileNames = {testDataDir.name};
testFileNames = testFileNames(3:end);

[XTrain, YTrain, XTest, YTest] = load_dataset(trainingFileNames, testFileNames);
model = trainSillyWalkClassifier(XTrain, YTrain);

function model = trainSillyWalkClassifier(XTrain, YTrain)
% For this trivial example, no model is required. 
[layers, options] = specify_network();
model = trainNetwork(XTrain, YTrain, layers, options);


save(fullfile(fileparts(mfilename('fullpath')), 'Model.mat'), 'model'); % do not change this line
end


function [XTrain, YTrain, XTest, YTest] = load_dataset(trainingFileNames, testFileNames)

    targetSamplingRateHz = 50;    
    windowLengthSeconds = 3.4;
    
    XTrain = {};
    YTrain = {};
    for ind = 1:length(trainingFileNames)
       matFileName = trainingFileNames{ind};
       matFileContent = load(matFileName);
       [X, Y] = extractData(matFileContent, matFileName, targetSamplingRateHz, windowLengthSeconds);
       XTrain = [XTrain; X];
       YTrain = [YTrain; Y];
    end
    
    XTest= {};
    YTest = {};
    for ind = 1:length(testFileNames)
       matFileName = testFileNames{ind};
       matFileContent = load(matFileName);
       [X, Y] = extractData(matFileContent, matFileName, targetSamplingRateHz, windowLengthSeconds);
       XTest = [XTest; X];
       YTest = [YTest; Y];
    end
    
end 

function [layers, options] = specify_network()
% Your code here
inputSize = 3;
numHiddenUnits = 15;
numClasses = 2;

layers = [...
    sequenceInputLayer(inputSize)
    lstmLayer(numHiddenUnits,'OutputMode', 'last')
    dropoutLayer
    reluLayer
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

maxEpochs = 50;
miniBatchSize = 8;

options = trainingOptions('adam', ...
    'MaxEpochs', maxEpochs, ...
    'MiniBatchSize', miniBatchSize, ...
    'Verbose', false, ...
    'GradientThreshold', 1);

end