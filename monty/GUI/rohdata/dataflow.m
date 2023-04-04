function dataflow(inputfile,outputdatafile)

log=importdata(inputfile);
walk=timetable2table(log);
x=table2array(walk(:,2));
y=table2array(walk(:,3));
z=table2array(walk(:,4));

data(1,:)=x;
data(2,:)=y;
data(3,:)=z;

time=table2array(walk(:,1));
time.Format='ss.SSS';
time=str2double(string(time))';

save(outputdatafile,'data','time','-mat');

plot(time,data)
%title('Normal Walk')
legend('X axis', 'Y axis', 'Z axis')
xlabel('Relative Time [s]')
ylabel('Acceleration [m/s^2]')

end

