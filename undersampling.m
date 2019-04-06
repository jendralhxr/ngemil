# cacah sampel 2000
for i=1:1:2000
t=0.08*(i-1);
x(i)=i*t;
y(i)=sin(3*t)+0.5*cos(22*t)+0.1*sin(t);
end

# cacah sampel 500
for i=1:1:500
y1(i)=y(i*4);
y2(i)=y(i*4-1);
y3(i)=y(i*4-2);
y4(i)=y(i*4-3);
y5(i)=( y(i*4) + y(i*4-1) + y(i*4-2) + y(i*4-3) )/4;
end

subplot(2,2,2)
subplot(2,1,1)
plot(y)
subplot(2,1,2)
plot(y5) # atau y1-y4
