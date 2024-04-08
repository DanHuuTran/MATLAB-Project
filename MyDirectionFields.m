function MyDirectionFields(f,u,v)
[X, Y] = meshgrid(u,v); 
m = f(X,Y);    
L = sqrt(1 + m.^2);
quiver(X,Y, 1./L,m./L), axis tight