function [y,Q]=MyNeville(x,xi,yi)
m=length(x);
y=zeros(m,1);
%y=pn(x)
n=length(xi);%This is in fact n+1 since we have n+1 nodes.
Q=zeros(n);
Q(:,1)=yi;
for k=1:m
    for i=2:n
        for j=2:i
            Q(i,j)=((x(k)-xi(i-j+1))*Q(i,j-1)-(x(k)-xi(i))*Q(i-1,j-1))/(xi(i)-xi(i-j+1));
        end
    end
    y(k)=Q(n,n);
end
%if x has more then the matrix Q will only have values associated with x(end)