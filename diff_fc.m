function U1_dot=diff_fc1(t,U1)

%final position of two-link
L=2.5;
L1=2;
L2=1;

theta2_f=acos((L^2+L2^2-L1^2)/2*L*L2);
theta1_f=asin((L2*sin(theta2_f))/L1);
% theta1_f=pi/4;
% theta2_f=-pi/6;

U1_dot=zeros(6,1);
theta=[theta1_f  theta2_f];
pid1=[35 10 10];
pid2=[30 20 15];

U1_dot(1)=theta(1)-U1(3);
U1_dot(2)=theta(2) -U1(4);
U1_dot(3)=U1(5);
U1_dot(4)=U1(6);
U1_dot(5)=(( (-U1(6)^2*sin(U1(3)-U1(4))) - (19.62*cos(U1(3))) - cos(U1(3)-U1(4))*(2*U1(5)^2*sin(U1(3)-U1(4))-9.81*cos(U1(4))) )/(2*(2+cos(U1(3)-U1(4))^2) ) )  +pid1(1)*(theta(1) -U1(3)) - pid1(3)*U1(5) + pid1(2)*U1(1) ;

U1_dot(6)=((cos(U1(3)-U1(4))*(U1(6)^2*sin(U1(3)-U1(4))+ (19.62*cos(U1(3))) )  +  2*(2*U1(5)^2*sin(U1(3)-U1(4))-9.81*cos(U1(4)))  )  /  (2+cos(U1(3)-U1(4))^2) ) +pid2(1)*(theta(2)-U1(4)) -pid2(3)*U1(6) +pid2(2)*U1(2);
end
