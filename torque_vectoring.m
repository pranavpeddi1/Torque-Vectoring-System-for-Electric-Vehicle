clc
clear all
global delta;
delta = 1;
%% Vehicle Parameters

global l;l = 3;global v;v = 10;
global m;m = 1500;global g; g = 9.81;global a;a = 1.3;global b;b = 1.7;
global cf;cf = 50000;%67369;
global cr;cr = 80000;%63411;

%% 
%% Path Desired
%% 


x = 0;y = 0;r_des = l*180/(delta*pi);%% Using Kinematic Relationship

psidotdes = v/r_des;

X = [];Y =[];yaw = [];xloc =0;yloc = 0;

t1 = linspace(0,10,100);

for i = 1:length(t1)
    x = v*t1(i);X = [X x];
    y = 0;Y = [Y y];
    yawtemp = 0;yaw = [yaw yawtemp];
    if i==length(t1)
        xloc = x;yloc = y;      
    end
end
yaw = yaw(1:end-1);

%% First Turn
t2 = linspace(0,pi/(2*psidotdes),200);

for i = 1:length(t2)
    x = xloc + r_des*sin(psidotdes*t2(i));X = [X x];
    y = yloc + r_des*(1-cos(psidotdes*t2(i)));Y =[Y y];
    yawtemp = psidotdes*(t2(5)-t2(4));yaw = [yaw yaw(end)+yawtemp];
    if i==length(t2)
        xloc = x;yloc = y;      
    end
end
yaw = yaw(1:end-1);

%% Second Turn
t3 = linspace(0,pi/(2*psidotdes),200);

for i = 1:length(t3)
    x = xloc + r_des*(1-cos(psidotdes*t3(i)));X = [X x];
    y = yloc + r_des*sin(psidotdes*t3(i));Y = [Y y];
    yawtemp = psidotdes*(t3(5)-t3(4));yaw = [yaw yaw(end)-yawtemp];
    if i==length(t3)
        xloc = x;yloc = y;      
    end
end
yaw = yaw(1:end-1);

t4 = linspace(0,10,100);

for i = 1:length(t4)
    x = xloc + v*t4(i);X = [X x];
    y = yloc;Y = [Y y];
    yawtemp = yaw(end);yaw = [yaw yawtemp];
end
xfinal = X(end);

T1 = t1;T2 = [t2(2:end)+T1(end)];T3 = [t3(2:end)+T2(end)];T4 = [t4(2:end)+T3(end)];
T = [T1 T2 T3 T4];

figure(1)
% plot(X,Y,'b');
hold on
axis square
axis equal
xlabel('\bf x');ylabel('\bf y')

% % 
figure(2)
hold on
plot(T,yaw,'b')



%% 
%% Path Actual
%% 


kus = (m*g/l^2)*(b/cf - a/cr);factor = 1 + kus*v^2/(g*l);

x1 = 0;y1 = 0;r_act = l*180*factor/(delta*pi);%% Using Kinematic Relationship

psidotact = v/r_act;

X1 = [];Y1 =[];xloc = 0;yloc = 0;yaw1 = [];

%% Straight Path 1
t1 = linspace(0,10,100);

for i = 1:length(t1)
    x1 = v*t1(i);X1 = [X1 x1];
    y1 = 0;Y1 = [Y1 y1];
    yawtemp1 = 0;yaw1 = [yaw1 yawtemp1];
    if i==length(t1)
        xloc = x1;yloc = y1;      
    end
end
yaw1 = yaw1(1:end-1);

%% First Turn 
t2 = linspace(0,pi/(2*psidotdes),200);

% for i = 1:length(t2)
%     x1 = xloc + r_act*sin(psidotact*t2(i));X1 = [X1 x1];
%     y1 = yloc + r_act*(1-cos(psidotact*t2(i)));Y1 =[Y1 y1];
%     yawtemp1 = 0;yaw1 = [yaw1 yawtemp1];
%     if i==length(t2)
%         xloc = x1;yloc = y1;
%     end
% end
% yaw1 = yaw1(1:end-1);

tspan = t2;
global mze;
mze = yawm(psidotdes);
[t,psidot] = ode45(@yawrate,tspan,[0;0]);
rsteady = abs(psidot(end,1));

for i = 1:length(t2)
    X1(end);
    x1 = xloc + r_act*sin(rsteady*t2(i));
    if x1<X1(end)
        lent2 = i-1;
        break
    end
    X1 = [X1 x1];
    y1 = yloc + r_act*(1-cos(rsteady*t2(i)));Y1 =[Y1 y1];
    yawtemp1 = rsteady*(t2(2)-t2(1));yaw1 = [yaw1 yawtemp1];
end
xloc = X1(end);yloc = Y1(end);
yaw1 = yaw1(1:end-1);

%% Second Turn
t3 = linspace(0,pi/(2*psidotdes),200);

% for i = 1:length(t3)
%     x1 = xloc + r_act*(1-cos(psidotact*t3(i)));X1 = [X1 x1];
%     y1 = yloc + r_act*sin(psidotact*t3(i));Y1 = [Y1 y1];
%     yawtemp1 = 0;yaw1 = [yaw1 yawtemp1];
%     if i==length(t3)
%         xloc = x1;yloc = y1;
%     end
% end
% yaw1 = yaw1(1:end-1);

%% 
tspan = t3;
% [t,psidot] = ode45(@yawrate,tspan,[0;0]);
% rsteady = psidot(end,1);
% 
% for i = 1:length(t3)
%     x1 = xloc + r_act*(1-cos(rsteady*t3(i)));
%     y1 = yloc + r_act*sin(rsteady*t3(i));
%     if y1<Y1(end)
%         lent3 = i-1;
%         break
%     end
%     X1 = [X1 x1];Y1 = [Y1 y1];
%     yawtemp1 = 0;yaw1 = [yaw1 yawtemp1];
% end
% xloc = X1(end);yloc = Y1(end);
% yaw1 = yaw1(1:end-1);

%% Straight Path 2
t4 = linspace(0,10,100);

% for i = 1:length(t4)
%     x1 = xloc + v*t4(i);
%     y1 = yloc ;
%     X1 = [X1 x1];
%     Y1 = [Y1 y1];
%     yawtemp1 = 0;yaw1 = [yaw1 yawtemp1];
%     if x1>=xfinal
%         lent4 = i;
%         break
%     end
% end

% T1 = t1;T2 = [t2(2:lent2)+T1(end)];T3 = [t3(2:lent3)+T2(end)];T4 = [t4(2:lent4)+T3(end)];
% T = [T1 T2 T3 T4];

%% Plotting the Actual Path
figure(1)
plot(X1,Y1,'r');
legend('desired','actual','Location','northwest');
axis square
axis equal
xlabel('\bf x');ylabel('\bf y');title('\bf Path of Vehicle')

%% Plotting Yaw
% figure(2)
% % plot(T,yaw,'r');
% xlabel('Time');ylabel('Yaw');title('\bf Yaw vs Time')
% legend('desired','actual','location','northwest');

%% PLotting Steering Input
% figure(3)
% DELTA(1:length(T1)) = 0;
% DELTA(length(DELTA)+1:length(DELTA)+length(T2)) = delta;
% DELTA(length(DELTA)+1:length(DELTA)+length(T3)) = -delta;
% DELTA(length(DELTA)+1:length(DELTA)+length(T4)) = 0;
% 
% plot(T,DELTA,'r');
% ylabel('Steering Input {\delta}');
% xlabel(['Time (s)']);title('\bf Steering Input');



