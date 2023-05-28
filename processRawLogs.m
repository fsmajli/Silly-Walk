function [data, time] = processRawLogs(logFileName, samplingRate, thresholdTime)

if nargin > 2
    threshold = thresholdTime;
else
    threshold = 5;
end

load(logFileName);
acceleration = timetable2table(Acceleration);
data = table2array(acceleration(:, 2:4))';
time = 0:(1/samplingRate):(( (1/samplingRate) * height(acceleration(:,1))) - 1/samplingRate);
data(:, time < threshold) = [];
time(time < threshold) = [];
data(:, time > (time(end) - threshold)) = [];
time(time > (time(end) - threshold)) = [];
save('TrainingData/Group1_Walk6_S.mat', 'data', 'time')

end

