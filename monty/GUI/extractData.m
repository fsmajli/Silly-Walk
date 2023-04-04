% matFileName = 'ExampleWalk1_N.mat'
% matFileContent = load('ExampleWalk1_N.mat');
% targetSamplingRateHz = 60;
% windowLengthSeconds = 5;
% [X, Y] = extractData(matFileContent, matFileName, targetSamplingRateHz, windowLengthSeconds);

function [windowedData, labels] = extractData(matFileContent, matFileName, targetSamplingRateHZ, windowLengthSeconds)


samplingTime = (1/targetSamplingRateHZ):(1/targetSamplingRateHZ):windowLengthSeconds;

X = cell(1);

loopInd = floor((matFileContent.time(end)-windowLengthSeconds/2)/ (windowLengthSeconds/2));
for i = 1:loopInd
    x_data = interp1(matFileContent.time, matFileContent.data(1,:), samplingTime);
    y_data = interp1(matFileContent.time, matFileContent.data(2,:), samplingTime);
    z_data = interp1(matFileContent.time, matFileContent.data(3,:), samplingTime);

    data = [x_data; y_data; z_data];
    X(i) = num2cell(data, [1,2]);
    
    % figure(1);
    % axis tight
    % plot(matFileContent.time, matFileContent.data(1,:), 'k-', samplingTime, x_data, ':.');
    % hold on
    samplingTime = samplingTime(floor(length(data)/2)+1):(1/targetSamplingRateHZ):(samplingTime(end)+windowLengthSeconds/2);
end

windowedData = X';
label = extractBetween(matFileName, '_', '.');
label = extractAfter(label, '_');
labels = repmat(label{1}, [length(windowedData) 1]);
labels = cellstr(labels);
labels = categorical(labels);
end