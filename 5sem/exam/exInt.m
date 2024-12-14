x=1.5:0.001:pi;
y=intFunc(x);

trapz(x,y)
quad(@intFunc,1.5,pi)