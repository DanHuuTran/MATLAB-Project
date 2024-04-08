function I=MyCompMidpoint(f,a,b,n)
if  mod(n,2)==1
    disp('n must be even')
    I=[];
    return
else
    h=(b-a)/(n+2);
    xi=a:h:b; %this has n+3 nodes and the bounds a and b are not used.
    I=0;
    for i=2:n+2
        if mod(i,2)==0 
           I=I+f(xi(i));
        end
    end
end
I=I*2*h;