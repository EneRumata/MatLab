t=0:0.01:2;
[x,y]=XandYoft(t);
plot(x,y)
hold on

t1=0.4;
[x1,y1]=XandYoft(t1);
plot(x1,y1,'g*')
[x,y]=XandYoft([t1-0.005 t1+0.005]);
x=x(2)-x(1);
y=y(2)-y(1);
lx=x1-x*20:x:x1+x*20;
ly=y1-y*20:y:y1+y*20;
plot(lx,ly,'g')

t2=0.8;
[x2,y2]=XandYoft(t2);
plot(x2,y2,'r*')
[x,y]=XandYoft([t2-0.005 t2+0.005]);
x=x(2)-x(1);
y=y(2)-y(1);
lx=x2-x*20:x:x2+x*20;
ly=y2-y*20:y:y2+y*20;
plot(lx,ly,'r')
