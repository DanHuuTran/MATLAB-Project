function [x,w] = MyEuler(f,a,b,alpha,n)
h= (b-a)/n;
x = a:h:b;
w=zeros(1, n+1);
w(1) = alpha;
for i = 1:n
    w(i+1) = w(i)+h*f(x(i), w(i));
end
hold on

%PLOTTING THE ERROR BOUND:
% fidnding L and M;




plot(x,w);
axis tight
