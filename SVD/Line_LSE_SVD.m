clc; close all; clear;

% Noise level
scale = 2.0;

% Line Parameters (ax+by+c=0)
a = 0.5; b = -1; c = -5;

% Points on the line
x = [-10:1:10]';
y = (-a*x-c)/b;

% Noise addition
xn = x + randn(size(x))*scale;
yn = y + randn(size(x))*scale;

% Line Estimation using LSM
X = [xn yn ones(size(xn))];
[U D V] = svd(X);
p = V(:,end);

% Result drawing
figure; plot(xn,yn,'bo'); axis equal; grid on; hold on;
plot(x, (-a*x-c)/b, 'g-');
plot(x, (-p(1)*x-p(3))/p(2), 'r-'); hold off;
legend('Point with Noise', 'True Line', 'Estimated Line (SVD)');
title('Line Estimation using (LSE+SVD)')
