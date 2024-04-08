function [p.i] = MyBisection(f,a,b,tol.NO)
if f(a)*f(b)<0
    fprintf (['n/t p_n/n'])
    i=1;
    FA = f(a);
    while (i <= NO)
        dp = (b-a)/2;
        p = a+dp;
        FP = f(p);
        if (FP == 0) || (dp < tol)
            return
        end
        if FA*FP > 0
            a =p;
            FA = FP;
        else b =p;
        fprintf ('%d\t %0.16f\n', i p)
        i = i+1;
    end
    fprintf ('The medthod failed after %d iterations', NO)
    else 
        fprintf('There is no soluiotn between a = %4f and b =%.f\n', a,b)
    end