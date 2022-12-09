% Open loop, PV plot
opt1 = stepDataOptions('StepAmplitude',0.8); %step amplitude of LO
% Feedback, closed loop r vs y plot, or SP vs PV
opt2 = stepDataOptions('InputOffset',2.24,'StepAmplitude',0.53); %step amplitude of LO
%Controller Loop output plot- closed loop
opt3 = stepDataOptions('InputOffset',48.9);

Kp=2.35; Ki=0.35; Kd=0;
time=4000; %in seconds

%K_sys and T_sys
fprintf("Place the system in manual, change the loop output (LO)\nand watch the response until it reaches steady level.\n")
fprintf("Please enter the following information:\n");
PV_initial = input("PV_initial: ");
PV_final = input("PV_final: ");
LO_initial = input("LoopOutput_initial: ");
LO_final = input("LoopOutput_final: ");
K_sys =(PV_final - PV_initial) / (LO_final - LO_initial);
fprintf('K_sys is : [%i]\n',K_sys);

fprintf("Please enter the time it takes to get to ~63 percent of steady state.\n");
T_sys = input("Time in seconds: ");


PID_function(K_sys,T_sys,time,Kp,Ki,Kd,opt1,opt2,opt3)


