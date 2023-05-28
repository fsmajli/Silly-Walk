function [windowedData, labels] = extractData(matFileContent, matFileName, targetSamplingRateHZ, windowLengthSeconds)
                                                               
samplingTime = 0:(1/targetSamplingRateHZ):matFileContent.time(end);       
interpData = transpose(interp1(matFileContent.time, matFileContent.data', samplingTime));          

windowedData = cell(1); 
stepSize = targetSamplingRateHZ*windowLengthSeconds - mod(targetSamplingRateHZ*windowLengthSeconds, 10);

startNewVector = 1;
loopInd = floor((length(interpData)/stepSize)*2)-1;

for i = 1:loopInd
    windowedData{i} = interpData(:, startNewVector:(startNewVector+stepSize-1));                                                         % Store data in cell
    startNewVector = startNewVector + (stepSize/2);
end

windowedData = windowedData';                           % First output, cell containing the data

label = extractBetween(matFileName, '_', '.');          % Split filename string such that we only get the letter between the second
label = extractAfter(label, '_');                       % _ and the . before mat

if isequal(label{1}, 'N')                               % Check if letter is 'N' or 'S', save label as 'Normal walk' or 'Silly
    label = cellstr('Normal walk');                     % walk' 
else
    label = cellstr('Silly walk');
end
labels = repmat(label{1}, [length(windowedData) 1]);    % Make a large vector out of label
labels = cellstr(labels);
labels = categorical(labels);                           % Convert labels into a categorical array

end