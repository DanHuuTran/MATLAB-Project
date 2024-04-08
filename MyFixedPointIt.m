function [p,i]=MyFixedPointIt(g,p0,tol,N0)
i=1;
fprintf('n\t\t p_n\n')
while(i<=N0)
    p=g(p0);
    fprintf('%d\t\t %.16f\n',i,p)
    if abs(p-p0)< tol
        return
    end
    p0=p;
    i=i+1;
end
fprintf('The fixed point iteration method failed after %d iterations',N0)