% Open loop, PV plot
opt1 = stepDataOptions('StepAmplitude',0.8); %step amplitude of LO
% Feedback, closed loop r vs y plot, or SP vs PV
opt2 = stepDataOptions('InputOffset',2.24,'StepAmplitude',0.53); %step amplitude of LO
%Controller Loop output plot- closed loop
opt3 = stepDataOptions('InputOffset',48.9);

Kp=2.35; Ki=0.35; Kd=0;
time=4000; %in seconds

%K_sys and T_sys
K_sys=9;
T_sys =400;

Milo_PID(K_sys,T_sys,time,Kp,Ki,Kd,opt1,opt2,opt3)
