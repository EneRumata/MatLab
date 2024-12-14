x=-1:0.001:pi/2;
y=ex3Func(x);
plot(x,y)
[x,y]=fminbnd(@ex3Func,-1,pi/2)