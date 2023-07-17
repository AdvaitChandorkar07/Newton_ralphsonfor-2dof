function   [output]=inverse(inputArg1,inputArg2,inputArg3)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
theta=deg2rad(60);

l1=3;
l2=3;
ct_matrix=[cos(theta),0,-sin(theta);sin(theta),0,cos(theta);0,-1,0];
input=ct_matrix\[inputArg1;inputArg2;inputArg3];
%disp(input);

%functions
syms theta1 theta2;
f1(theta1,theta2)=l2*cos(theta2)*cos(theta1)-l2*sin(theta2)*sin(theta1)+l1*cos(theta1)-input(1);
f2(theta1,theta2)=l2*cos(theta2)*sin(theta1)+l2*sin(theta2)*cos(theta1)+l1*sin(theta1)-input(2);

guess=[1,1];


%differentiating
f1theta1(theta1,theta2)=diff(f1,theta1);
f1theta2(theta1,theta2)=diff(f1,theta2);
f2theta1(theta1,theta2)=diff(f2,theta1);
f2theta2(theta1,theta2)=diff(f2,theta2);

f11=matlabFunction(f1);
f22=matlabFunction(f2);

f1theta11=matlabFunction(f1theta1);
f1theta22=matlabFunction(f1theta2);
f2theta11=matlabFunction(f2theta1);
f2theta22=matlabFunction(f2theta2);


for i=1:10
    F=[f11(guess(1),guess(2));f22(guess(1),guess(2))];
    J=[f1theta11(guess(1),guess(2)),f1theta22(guess(1),guess(2));...
        f2theta11(guess(1),guess(2)),f2theta22(guess(1),guess(2))];
    y=-J\F;
    guess=guess+y;
end

theta1=guess(1,1);
theta2=guess(2,2);
theta1=rad2deg(theta1);
theta2=rad2deg(theta2);
%taking principle values
for i=1:10
    if theta1<360
        break
    end
    theta1=theta1-360;
end

%taking principle values
for i=1:10
    if theta2<360
        break 
    theta2=theta2-360;
    end
end

disp(theta1);
disp(theta2);

output=[theta1,theta2];

end