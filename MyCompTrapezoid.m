function I=MyCompTrapezoid(f,a,b,n)
h=(b-a)/n;
xi=a:h:b;
I=0;
for i=2:n
    I=I+f(xi(i));
end
I=h/2*(2*I+f(a)+f(b));
