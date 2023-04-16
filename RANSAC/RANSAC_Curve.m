clc; close all; clear;

% Noise level
scale = 0.2;

% Line parameters (y=ax^2+bx+c)
a = 0.2; b = -0.4; c= 3;

% Points on the line
x = (-10:1:10)';
y = a*x.^2 + b*x + c;

% Outliers
outNum = 5;
xo = (rand(outNum,1)-0.5)*30;
yo = (rand(outNum,1)-0.5)*20;
xo = [x; xo];
yo = [y; yo];

% Noise Addition
xn = xo + randn(size(xo))*scale;
yn = yo + randn(size(xo))*scale;

% Line Estimation Using RANSAC
p = 0.99; e = outNum/length(xn); s = 3;
N = log(1-p)/log(1-(1-e)^s);
thresh = 0.1;
max = 0;

% Using LSM
X = [xn.^2 xn ones(length(xn),1)];
pLSM = inv(X'*X)*X'*yn;

for i=1:ceil(N)
    % randomly select samples from whole data
    id = randperm(length(xn),s);

    % Using Pseudo Inverse + RANSAC
    X = [xn(id).^2 xn(id) ones(s,1)];
    P = inv(X'*X)*X'*yn(id);

    err = abs(P(1)*xn.^2 + P(2)*xn + P(3) -yn);
    cnt = sum(err<thresh);

    if cnt > max
        max = cnt;
        pRANSAC = P;
    end
end

% Result Drawing
figure; plot(xn,yn,'bo'); axis equal; grid on; hold on;
plot(x, a*x.^2+b*x+c, 'g-');
plot(x, pRANSAC(1)*x.^2+pRANSAC(2)*x + pRANSAC(3),'k-');
plot(x, pLSM(1)*x.^2+pLSM(2)*x + pLSM(3),'r-');
hold off;
title("Robust Estimation Using RANSAC (outliers = 5)");
legend('Points contaminated by Noise','True Line', 'RANSAC', 'LSM');