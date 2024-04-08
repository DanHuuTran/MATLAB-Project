function I=MyCompSimpson(f,a,b,n)
if mod(n,2)==1
    disp('n must be even')
    I=[];
    return
    %To avoid an error message since I was not previously assigned
else
    h=(b-a)/n;
    xi=a:h:b;%x0(1)=x_0, x0(2)=x_1,...,x0(n+1)=x_n
    Ie=0;
    Io=0;
    for i=2:n %PAY ATTENTION HERE n is not the last index it is the index before 
the last
        if mod(i,2)==0
            Ie=Ie+f(xi(i));
        else
            Io=Io+f(xi(i));
        end
    end
    I=(h/3)*(f(a)+4*Ie+2*Io+f(b));%It is better to multiply Ie by 4 and Io by 2 
here to have only 2 multiplications as opposed to n-1 mutilplications 
end
        