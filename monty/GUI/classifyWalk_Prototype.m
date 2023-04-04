addpath('ExampleData', 'TestData', 'TrainingData')

trainingDataDir = dir('TrainingData');
trainingFileNames = {trainingDataDir.name};
trainingFileNames = trainingFileNames(3:end);

testDataDir = dir('TestData');
testFileNames = {testDataDir.name};
testFileNames = testFileNames(3:end);

[XTrain, YTrain, XTest, YTest] = load_dataset(trainingFileNames, testFileNames);
%[model,info] = trainSillyWalkClassifier(XTrain, YTrain);


YPred = classifyWalk(model, XTest);
%accuracy = sum(YPred == YTest)/numel(YTest)*100
cm=confusionmat(YTest, YPred);
xvalues={'N','S'};
yvalues={'N','S'};
%confusionchart(YTest, YPred);
h=heatmap(xvalues,yvalues,cm);


