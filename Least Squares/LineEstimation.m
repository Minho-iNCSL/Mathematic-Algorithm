clc; close all; clear;

% Noise level
scale = 2;

% Line Parameters (y=ax+b)
a = 0.5; b = -5;

% Points on the line
x = (-10:1:10)';
y = a*x + b;

% Noise addition
xn = x + randn(size(x))*scale;
yn = y + randn(size(y))*scale;

% Line Estimation using LSM
X = [xn ones(size(xn))];
p = inv(X'*X)*X'*yn;

% Plot
figure; plot(xn,yn,'bo'); axis equal; grid on; hold on;
plot(x, y, 'g-');
plot(x, p(1)*x+p(2), 'r-'); hold off;
legend('Point with Noise', 'True Line', 'Estimated Line');
title('Line Estimation using LSE')
