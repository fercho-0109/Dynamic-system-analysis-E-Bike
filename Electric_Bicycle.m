% Simulation of a e-bike  
%
%-----SIMULATION IN MATLAB/Simulink--------------------------
%
% #################################################################################
% Edited by Alexis Marino (alexismarino0109@gmail.com) September, 29th 2021
% #################################################################################
%
% Final project of the Industrial Automation coursea
% Electric bike 
% RATED VALUES
% maximum motor angular velocity (3000 rpm)
% Parameter
clear all
clc
%-------------------------------------------%
Jm=1.9e-5; % moment of inertia of the motor 
Bm=1e-6;   % friction coefficient of the motor
Rm=0.85;   % motor electrical resistance
Lm=0.003;  % motor inductance
Kb=0.16;  % back-emf constant 
Kt=0.16;  % torque constant
Jb=4.5;   % moment of inertia of the bike with rider 
B=0.2;    % viscous coefficient
Em=25;    % the gear ratio of the gearboxes between the motor and the pedal shaft
Eg=0.73; %rear gear ratio in third gear 
Jeq=Jm+(Jb/((Em^2)*(Eg^2)));
Beq=Bm+(B/((Em^2)*(Eg^2)));
Electric_Bike
%__________State Space_______________________________________%
A=[-Rm/Lm -Kb/Lm; Kt/Jeq -Beq/Jeq];
B=[1/Lm 0;0 1/(Jeq*Em)];
C=[0 1/(Em*Eg)];
D=[0 0];
[V,D,W] = eig(A); %eigenvalues, right_eigenvectors, left_eigenvectors 
Vs=vpa(V,2);Ds=vpa(D,2);
syms t
expodeAt=simplify(Vs*expm(Ds*t)*inv(Vs)); % exponential matrix
sys=ss(A,B,[C;1 0],[0 0;0 0]);
initial(sys,[0,150]) % Free responce for these initial conditions
%____________lyapunov Algebraic Ecuation___________________________%
F=[3 1;1 1];
P = lyap(A,F); % proof of asymptotical stability  
%____________Estructural properties________________________________%
R=ctrb(A,B); % Reachability matrix
O=obsv(A,C); % Observability matrix
p1=-5+1i;
p2=-5-1i;
kc=place(A,B,[p1 p2]); %location of the poles
t=0:0.01:3;
step(A-B*kc,B,[C],[0 0],1,t); %Answer of the Close loop system 
L=acker(A',C',[-20;-30])';   % location on the poles Observer
AO=[A-L*C];
BO=[B L];
CO=eye(2);
DO=zeros(2,3);
%__________________________________________________________________%
Tf=tf(Kt,[Lm*Jeq (Rm+Lm*Beq) ((Rm*Beq)+(Kt*Kb))]);
Ge=tf(1,[Lm Rm]);
Gm=tf(1,[Jeq Beq]);
G=zpk(feedback(Ge*Gm*Kt,Kb));
G1=(Ge*Gm*Kt);
pzplot(G,G1); % poles in close and open loop
%_________________________________________________%
%Ge1=tf(0.6,[La Ra]);
%a1=tf(K,[La/Ra 1]);
%k2=10;
%a2=tf([J*k2 B*k2] ,[1 0]);
%G2=zpk(feedback(a1*a2*Gm,1))% trasfer fuction to see poles after control 
%pzplot(G1);
