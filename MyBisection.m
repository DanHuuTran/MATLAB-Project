function [p,i]=MyBisection(f,a,b,tol,N0)
if f(a)*f(b)<0
fprintf('n\t p_n\n')
i=1;
FA=f(a);
while(i<=N0)
    dp=(b-a)/2;
    p=a+dp;
    FP=f(p);
    if (FP==0) || (dp<tol)
        return
    end
    if FA*FP>0
        a=p;
        FA=FP;
    else
        b=p;
    end
    fprintf('%d\t %0.16f\n',i,p)
    i=i+1;
end
fprintf('The method failed after %d iterations',N0)
else
    fprintf('There is no solution between a=%.4f and b=%.4f\n',a,b)
end