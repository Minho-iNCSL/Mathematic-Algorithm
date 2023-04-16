clc; close all; clear;

% Noise level
scale = 0.2;

% Line parameters (y=ax+b)
a = -0.4; b = -5;

% Points on the line
x = (-10:1:10)';
y = a*x + b;

% Outliers
outNum = 10;
xo = (rand(outNum,1)-0.5)*30;
yo = (rand(outNum,1)-0.5)*20-10;
xo = [x; xo];
yo = [y; yo];

% Noise Addition
xn = xo + randn(size(xo))*scale;
yn = yo + randn(size(xo))*scale;

% Line Estimation Using RANSAC
p = 0.99; e = outNum/length(xn); s = 2;
N = log(1-p)/log(1-(1-e)^s);
thresh = 0.1;
max = 0;

% Using LSM
X = [xn ones(length(xn),1)];

pRANSAC = inv(X'*X)*X'*yn;

for i=1:ceil(N)
    % randomly select samples from whole data
    id = randperm(length(xn),s);

    % Using RANSAC
    m = (yn(id(1))-yn(id(2)))/(xn(id(1))-xn(id(2)));
    k = yn(id(1)) - m*xn(id(1)); 
  
    err = abs(m*xn+k-yn);
    cnt = sum(err<thresh);

    if cnt > max
        max = cnt;
        pLSM = [m,k];
    end
end

% Result Drawing
figure; plot(xn,yn,'bo'); axis equal; grid on; hold on;
plot(x, a*x+b, 'g-');
plot(x, pLSM(1)*x+pLSM(2),'k-');
plot(x, pRANSAC(1)*x+pRANSAC(2),'r-');
hold off;
title("Robust Estimation Using RANSAC (outliers = 10)");
legend('Points contaminated by Noise','True Line', 'RANSAC', 'LSM');