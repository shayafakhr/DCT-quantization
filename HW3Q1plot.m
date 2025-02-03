% ENSC180, HW3, Q1, image DCT domain quantization
% for barbara.pgm

close all;

qstep = [1, 10, 20, 50, 100];
nonzeros = [229897	83952	51714	25430	13152];
mse = [0.083626, 6.333748, 16.939667, 58.996746, 145.144226];

figure;
plot(qstep, nonzeros, '-ro');
grid on;
xlabel('Q Step');
ylabel('Number of Non-zeros');

figure;
plot(qstep, mse, '-ro');
grid on;
xlabel('Q Step');
ylabel('MSE');
