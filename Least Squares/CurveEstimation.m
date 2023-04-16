clc; close all; clear;

% Noise level
scale = 2;

% Curve Parameters (y=ax^2+bx+c)
a = 0.1; b = -0.5; c = 2;

% Points on the Curve
x = (-10:1:10)';
y = a*x.^2 + b*x + c;

% Noise addition
xn = x + randn(size(x))*scale;
yn = y + randn(size(y))*scale;

% Line Estimation using LSM
X = [xn.^2 xn ones(size(xn))];
p = inv(X'*X)*X'*yn;

% Plot
figure; plot(xn,yn,'bo'); axis equal; grid on; hold on;
plot(x, y, 'g-');
plot(x, p(1)*x.^2+p(2)*x + p(3), 'r-'); hold off;
legend('Point with Noise', 'True Curve', 'Estimated Curve');
title('Curve Estimation using LSE')
