function Milo_PID(K_sys,T_sys,time,Kp,Ki,Kd,opt1,opt2,opt3)

s = tf('s');
P =K_sys/(T_sys*s+1);  
t = 0:1:time;
pidTuner(P);
%% Open loop, PV response plot
figure
step(P,t,opt1)
title(' Manual PV response model')
%%
C = pid(Kp,Ki,Kd);
T = feedback(C*P,1);
%%
figure
step(T,t,opt2)
title(' Auto PV response model')
%%
figure
step(C/(1+C*P),t,opt3)
title('Auto Loop output response model')

end
