function [x,w] = MyRungeKutta(f,a,b,alpha,n)
h= (b-a)/n;
x = a:h:b;
w=zeros(1, n+1);
w(1) = alpha;
for i = 1:n
   k1=h*f(x(i),w(i));
   k2=h*f(x(i)+(h/2),w(i)+(k1/2));
   k3=h*f(x(i)+(h/2),w(i)+(k2/2));
   k4=h*f(x(i)+h,w(i)+k3);
   x(i+1)=a+i*h;
   w(i+1)=w(i) + (k1+2*k2+2*k3+k4)/6;
  
end
plot(x,w)
hold on