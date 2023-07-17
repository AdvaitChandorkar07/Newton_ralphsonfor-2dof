function [x,y,z] = forward(alphaa,theta1,theta2,d)
l1=3;
l2=3;
alphaa=deg2rad(alphaa);
theta1=deg2rad(theta1);
theta2=deg2rad(theta2);
base2link1=DH_matrix(alphaa,deg2rad(-90),0,0);
link12link2=DH_matrix(theta1,0,0,l1);
link22ct=DH_matrix((deg2rad(90)+theta2),deg2rad(90), 0, 0);
ct2slider=DH_matrix(0,0,(l2+d),0);

final_matrix=base2link1*link12link2*link22ct*ct2slider;

x = final_matrix(1,4);
y = final_matrix(2,4);
z = final_matrix(3,4);
disp(x);
disp(y);
disp(-z);
end