function PID_function(K_sys,T_sys,time,Kp,Ki,Kd,opt1,opt2,opt3)

s = tf('s');                % step response 
P =K_sys/(T_sys*s+1);       % plant function
t = 0:1:time;               % time per step
pidTuner(P);                % launch PID tuner
%% Open loop, PV response plot

f1 = figure;                      % create figure to plot on
[y1,t1] = step(P,t,opt1);             % run open loop
subplot(3,1,1)
plot(t1,y1)
title(' Manual PV response model')
xlabel('Time (sec)'), ylabel('PV')
%%  
C = pid(Kp,Ki,Kd);          % create PID controller
T = feedback(C*P,1);        % 
%%
[y2,t2] =step(T,t,opt2);           % 
subplot(3,1,2)
plot(t2,y2)
title(' Auto PV response model')
xlabel('Time (sec)'),ylabel('PV')
%%
[y3,t3] =step(C/(1+C*P),t,opt3);
subplot(3,1,3)
plot(t3,y3)
title('Auto Loop output response model')
xlabel('Time (sec)'),ylabel('PV')
%% Add to guide
guide(f1)
end
