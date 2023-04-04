function [data, time] = processRawLogs(logFileName, samplingRate)

load(logFileName);
acceleration = timetable2table(Acceleration);
data = table2array(acceleration(:, 2:4))';
time = 0:(1/samplingRate):(( (1/samplingRate) * height(acceleration(:,1))) - 1/samplingRate);
save('TrainingData/Group1_Walk4_S.mat', 'data', 'time')

end

