function [x,y] = XandYoft(t)
%UNTITLED2
v=10;
R=1;
r=0.5;
x= v.*t - r.*sin(v.*t./R);
y= R    - r.*cos(v.*t./R);
end

