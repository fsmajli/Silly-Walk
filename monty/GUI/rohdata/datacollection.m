clear

dataflow('normal.mat','_Walk1_N.mat');
dataflow('silly1.mat','_Walk1_S.mat');
dataflow('silly2.mat','_Walk2_S.mat');
dataflow('silly3.mat','_Walk3_S.mat');
dataflow('silly4.mat','_Walk4_S.mat');

data1=importdata('_Walk1_N.mat');
data2=importdata('_Walk1_S.mat');
data3=importdata('_Walk2_S.mat');
data4=importdata('_Walk3_S.mat');
data5=importdata('_Walk4_S.mat');

subplot(5,1,1);
plot(data1.time,data1.data)
title('Normal Walk')
xlabel('Relative Time [s]')
ylabel('Acceleration [m/s^2]')

subplot(5,1,2);
plot(data2.time,data2.data)
title('silly Walk 1')
xlabel('Relative Time [s]')
ylabel('Acceleration [m/s^2]')

subplot(5,1,3);
plot(data3.time,data3.data)
title('silly Walk 2')
xlabel('Relative Time [s]')
ylabel('Acceleration [m/s^2]')

subplot(5,1,4);
plot(data4.time,data4.data)
title('silly Walk 3')
xlabel('Relative Time [s]')
ylabel('Acceleration [m/s^2]')

subplot(5,1,5);
plot(data5.time,data5.data)
title('silly Walk 4')
xlabel('Relative Time [s]')
ylabel('Acceleration [m/s^2]')


