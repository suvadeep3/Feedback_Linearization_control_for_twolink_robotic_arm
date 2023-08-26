clc;clear all;close all;

%initial position of two-link
theta1_ini=pi/2;
theta2_ini=pi/2;


t=linspace(0,14,200);
[t,U1]= ode45('diff_fc',t,[0 0 theta1_ini theta2_ini 0 0]);
figure(1);
plot(t,U1(:,3),'Color','r')

hold on
plot(t,U1(:,4),'Color','b')
xlabel('Time');ylabel('Angle(rads)')
legend('Theta(1)','Theta(2)')
grid on;

%%
% Animation and plots
L1=3;
L2=2;

Theta1=[U1(:,3)];
Theta2=[U1(:,4)];
figure(3);

hL1=plot([0 L1*cos(Theta1(1))],[0 L1*sin(Theta1(1))],'r-','LineWidth',2);
hold on;
hB1=plot(L1*cos(Theta1(1)),L1*sin(Theta1(1)),'bo','MarkerFaceColor','b');
hold on;
hL2=plot([L1*cos(Theta1(1))  L1*cos(Theta1(1))+L2*cos(Theta2(1))],[L1*sin(Theta1(1))  L1*sin(Theta1(1))+L2*sin(Theta2(1))],'g','LineWidth',2);
hB2=plot(L1*cos(Theta1(1))+L2*cos(Theta2(1)),L1*sin(Theta1(1))+L2*sin(Theta2(1)),'bo',MarkerFaceColor='b');

axis([-6 6 -6 6]);
 grid on;


for i=1:200
    set(hL1,'XData',[0 L1*cos(Theta1(i))],'YData',[0 L1*sin(Theta1(i))]);
    set(hB1,'XData',L1*cos(Theta1(i)),'YData',L1*sin(Theta1(i)));
    set(hL2,'XData',[L1*cos(Theta1(i))  L1*cos(Theta1(i))+L2*cos(Theta2(i))],'YData',[L1*sin(Theta1(i))  L1*sin(Theta1(i))+L2*sin(Theta2(i))]);
    set(hB2,'XData',L1*cos(Theta1(i))+L2*cos(Theta2(i)),'YData',L1*sin(Theta1(i))+L2*sin(Theta2(i)));
    drawnow;

    pause(0.05);

end

