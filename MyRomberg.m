function [I,R]=MyRomberg(f,a,b,m)
R=zeros(m);
for k=1:m
    R(k,1)=MyCompTrapezoid(f,a,b,2^(k-1));
end
for k=2:m
    for j=2:k
        R(k,j)=R(k,j-1)+(R(k,j-1)-R(k-1,j-1))/(4^(j-1)-1);
    end
end
I=R(m,m);