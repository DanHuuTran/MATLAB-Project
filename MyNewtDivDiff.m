function [y,coeff,pn,F]=MyNewtDivDiff(x,xi,yi)
n=length(xi); %this is in fact n+1
F=zeros(n);
F(:,1)=yi;
for i=2:n
    for j=2:i
        F(i,j)=(F(i,j-1)-F(i-1,j-1))/(xi(i)-xi(i-j+1));
    end
end
%%%%%%Writing up the polynomial
coeff=zeros(1,n);
m=length(x);
y=F(1,1)*ones(1,m);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
coeff(n)=F(1,1);  %This is an addition to get the coefficients
temp=1;           % of Pn(x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p=ones(1,m);
for i=2:n
    p=p.*(x-xi(i-1));%(x-x0)(x-x1)....(x-x_(n-1))
    y=y+F(i,i)*p;%f00+f11(x-x0)+f22(x-x0)(x-x1)+.....+fnn(x-x0)...(x-x_(n-1))
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    temp=conv(temp,[1 -xi(i-1)]); %this outputs the coefficients of (x-x0)*...*(x-x_(i-1))
    coeff=coeff+cat(2,zeros(1,n-length(temp)),F(i,i)*temp);% This adds liketerms in the polynomial expansion
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Outputting the polynomial as a function handle
pn=@(x) 0;
for i=1:n
    pn=@(x) pn(x)+coeff(i)*x.^(n-i);
end