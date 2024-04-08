function [p,i]=MyNewtonSolver(f,fp,p0,tol,N0)
%f is inputed as an anonymous function for example @(x) x^2 represents the
%function f(x)=x^2
%p reprensents p1 from notes
if fp(p0)==0 
    disp('The initial guess is not carefully chosen.')
    p=[];
else
    fprintf('n\t pn\n')
    fprintf('%d\t %f\n',0,p0)
    i=1;
    while (i<=N0)
        if fp(p0)~=0
            p=p0-f(p0)/fp(p0); 
            fprintf('%d\t %.16f\n',i,p)
            if abs(p-p0)<tol
                return
            else 
                p0=p;
                i=i+1;   
            end
        else
            fprintf('A local extremum %.16f is reached after %d iterations.\n',p0,i)
            return
        end
    end
    disp('The method was unsuccessful')
    
end
    
