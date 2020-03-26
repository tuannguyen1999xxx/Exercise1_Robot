%Kcach 2 banh(m)
l = 0.2;
%duong kinh tam quay cung tron
d = 0.35;
%ban kinh banh xe
r = 0.2;
%thoi gian lay mau
dt = 0.01;
r1 = ((0.1)^2)*pi;
rotate = r1/1;
sample = [165 140 150 600 90];

tongsomau = sum(sample);

theta = zeros(tongsomau,1);
x = zeros(tongsomau,1);
y = zeros(tongsomau,1);

vl1 = zeros(sample(1),1);
vr1 = zeros(sample(1),1);
vl1 = vl1 + 2.111848395;
vr1 = vr1 + 1.343903524;

vl = [vl1;-(zeros(sample(2),1)+rotate*3);zeros(sample(3),1)+0.644444444;(zeros(sample(4),1)+rotate*1.5);zeros(sample(5),1)+0.58];
vr = [vr1;zeros(sample(2),1)+rotate*3;zeros(sample(3),1)+0.3555555556;-(zeros(sample(4),1)+rotate*1.5);zeros(sample(5),1)+0.92];

vl(1) = 0;
vr(1) = 0;
v = (vl+vr)/2;
w = (vr-vl)/l;

for i = 2:(tongsomau)
    theta(i) = theta(i-1) + w(i)*dt;
end
for i = 2:(tongsomau)
    x(i) = x(i-1) + v(i)*dt*cos((theta(i-1)+theta(i))/2);
end
for i = 2:(tongsomau)
    y(i) = y(i-1) + v(i)*dt*sin((theta(i-1)+theta(i))/2);
end
plot(x,y);