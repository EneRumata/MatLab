x=0:0.001:pi*2;
y=exDiffFunc(x);
y0=diff(y)/0.001;

x0=x;
x0(length(x0))=[];%Для построения графика матрицы должны быть одной размерности
%Поэтому я удалил последний элемент

plot(x0,y0)
hold on

a=pi/4;%Точка в которой надо найти скорость (дифференциал)
a0=[a-0.001 a+0.001];%берём две точки слева и справа
b=exDiffFunc(a0);
b=diff(b);%с помощью diff находим скорость изменения функции...
%...между точками за время 0.002 (разница между a0(1) и a0(2))
b=b/0.002%делим на эту разницу и получаем нормальную производную

plot(a,b,'g*')
