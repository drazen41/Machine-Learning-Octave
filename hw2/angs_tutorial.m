clear
clc
%load test.dat; % uèitava txt file , isto kao load('test.dat') 
%v = randi(10,5);
%save randInts.mat v; % binarni format
%save randInts.txt v -ascii;

% ploting
t = (0:0.01:0.98);
y1 = sin(2*pi*4*t);
plot(t,y1);
y2 = cos(2*pi*4*t);
hold on;
plot(t,y2);
xlabel('time');
ylabel('value');
legend('sin','cos');
title('my plot');
print -dpng 'myPlot.png';
close
figure(1);plot(t,y1);
figure(2);plot(t,y2);
subplot(1,2,1);
plot(t,y1);
subplot(1,2,2);
plot(t,y2);
axis([0.5 1 -1 1]);