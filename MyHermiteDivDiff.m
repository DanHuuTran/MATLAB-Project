
function [y,coeff,Hm,F] = MyHermiteDivDiff(x,xi,yi,ypi)
n=2*length(xi);%this is in fact 2(n+1)
zi=zeros(1,n);%[x0 x0 x1 x1 .... xn xn]
F=zeros(n);
%Populating the first two columns of F
zi(1)=xi(1);
F(1,1)=yi(1);
for i=2:n
     zi(i)=xi(ceil(i/2));
     F(i,1)=yi(ceil(i/2));
     if mod(i,2)==0 
        F(i,2)=ypi(i/2);%0/0 case
     else
        F(i,2)=(F(i,1)-F(i-1,1))/(zi(i)-zi(i-1));
     end
end
%Populating column 3 to column 2n+2
for i=2:n
    for j=3:i
        F(i,j)=(F(i,j-1)-F(i-1,j-1))/(zi(i)-zi(i-j+1));
    end
 end
%%%%%%Writing up the polynomial
%m=length(x);
%y=F(1,1)*ones(1,m);
%p=ones(1,m);
coeff=zeros(1,n);
coeff(n)=F(1,1);  %This is an addition to get the coefficients
temp=1;       
for i=2:n
    %p=p.*(x-zi(i-1));
    %y=y+F(i,i)*p;
    temp=conv(temp,[1 -zi(i-1)]); %this outputs the coefficients of (x-x0)*...*(x-
x_(i-1))
    coeff=coeff+cat(2,zeros(1,n-length(temp)),F(i,i)*temp);% This adds liketerms in
the polynomial expansion
end
%Outputting the polynomial as a function handle
Hm=@(x) 0;
for i=1:n
    Hm=@(x) Hm(x)+coeff(i)*x.^(n-i);
end
y=Hm(x);
