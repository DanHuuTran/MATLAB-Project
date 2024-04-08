function [x,w] = MathProject(f,fp,u,v)
    close all
%MyDirectionFields(f,u,v);
%hold on

%Asking user for initial value
alpha = input('Please input initial value for this proplem: ');
%plot with initial value
[u,v] = ode45(f,[u(1) u(end)], alpha);
plot (u,v)
hold on

%calling Euler Function
a=u(1);b=u(end);
h=u(2)-u(1);
n=fix((b-a)/h);
[x,w] = MyEuler(f,a,b,alpha,n);
plot(x,w);
hold on



%PLOTTING THE ERROR BOUND:
% fidnding L and M;

L=input('input a Lipschitz constant: ');
M= input('Enter a value M such that |y"(x)| < M: ');
K=h*M/(2*L);
for i=1:length(x)
    upper=w(i)+K*(exp(L*(x(i)-x(1)))-1);
    lower=w(i)-K*(exp(L*(x(i)-x(1)))-1);
    line([x(i),x(i)],[lower,upper])
end
hold on

%calling Taylor
%fp=@(x,y) input('Enter derivative of f with respect to t')
[x,w] =MyTaylor(f,fp,a,b,alpha,n)
hold on

%calling midpoint
[x,w] =MyMidpoint(f,a,b,alpha,n)
hold on
%calling Mod Euler
[x,w] = MyModEuler(f,a,b,alpha,n)
hold on
%calling RUnge-Kutta
[x,w]  = MyRungeKutta(f,a,b,alpha,n)
hold on
legend('','ODE45','Euler','Taylor','Mid Point','Modified Euler','Runge-Kutta','Location','Southwest')
hold off



end