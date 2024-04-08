function [x,w] = MyMidpoint(f,a,b,alpha,n)
h= (b-a)/n;
x = a:h:b;
w=zeros(1, n+1);
w(1) = alpha;
for i = 1:n
    w(i+1) = w(i)+h*f(x(i)+(h/2),w(i)+(h/2)*f(x(i),w(i)));
end
plot(x,w)
hold on