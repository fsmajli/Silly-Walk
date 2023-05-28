addpath('ExampleData', 'TestData', 'TrainingData')

trainingDataDir = dir('TrainingData');
trainingFileNames = {trainingDataDir.name};
trainingFileNames = trainingFileNames(3:end);
numData = length(trainingFileNames);
numRows = ceil(numData/2);
figure(1)

for ind = 1:length(trainingFileNames)
   load(trainingFileNames{ind});
   subplot(numRows, 2, ind)
   plot(time, data)
   xlim([0 100])
end