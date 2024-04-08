function [x,w] = MyTrapNewton(f,fy,a,b,alpha,n,M,tol)
h= (b-a)/n;
x = a:h:b;  
w=zeros(1, n+1);
w(1) = alpha;
for i = 2:n+1
    k1=w(i-1)+(h/2)*f(x(i-1), w(i-1));
    w0=k1;
    j=1;
    flag=0;
    while flag==0
        w(i) = w0-(w0-(h/2)*f(x(i-1)+h,w0)-k1) / (1-(h/2)*fy(x(i-1)+h,w0));
        if abs(w(i)-w0) < tol
            flag=1;
        else 
            j=j+1;
            w0=w(i);
            if j>M
                fprintf('The Maximum number of iterations exceeded');
            end
        end
    end
 
end
plot(x,w);
axis tight