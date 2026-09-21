clear
clc

N = 200;
alpha = 0.01;
R = 1;

WL = 16;
FL = 15;

x = randn(1,N);
x_q = fi(x,1,WL,FL);

g = fi(zeros(1,N),1,WL,FL);
y = fi(zeros(1,N),1,WL,FL);

g(1) = fi(1,1,WL,FL);

for n = 1:N-1
    mult1 = fi(g(n) * x_q(n),1,WL,FL);
    abs_block = fi(mult1^2,1,WL,FL);
    sum1 = fi(R,1,WL,FL) - abs_block;
    mult2 = fi(alpha,1,WL,FL) * sum1;
    g(n+1) = fi(g(n) + mult2,1,WL,FL);
    y(n) = mult1;
end

subplot(3,1,1)
plot(double(x_q))
title('Input (Fixed-Point)')

subplot(3,1,2)
plot(double(y))
title('Output (Fixed-Point)')

subplot(3,1,3)
plot(double(g))
title('Adaptive Gain (Fixed-Point)')
