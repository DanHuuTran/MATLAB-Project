function [x,w] = MyTaylor(f,fp,a,b,alpha,n)
h= (b-a)/n;
x = a:h:b;
w=zeros(1, n+1);
w(1) = alpha;
for i = 1:n
    w(i+1) = w(i)+h*f(x(i), w(i))+ (h^2/2)*fp(x(i),w(i));
end
plot(x,w)
hold on