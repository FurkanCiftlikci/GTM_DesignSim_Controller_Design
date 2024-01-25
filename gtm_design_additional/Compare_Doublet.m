% Talha Ulukır
%
%-------------- Doublet response, Simulation and Linear Models ------------
%
% Script trims the model to a level flight condition and linearizes.
% It compares doublet responses between full nonlinear sim and 
% the linearized model

% $Id: example1.m 4852 2013-08-06 22:12:54Z cox $
% david.e.cox@nasa.gov

% load nominal starting point into simulation model workspace
loadmws(init_design('GTM_T2'));

% Trim to nominal condition: level flight, alpha=3
SimVars=trimgtm(struct('gamma',-3));

% Load Simulation Variables (at trim condition) into Model Workspace
loadmws(SimVars);

% Linearize model about this condition
fprintf(1,'Linearizing...')
[sys,londyn,latdyn]=linmodel();
fprintf(1,' Done\n');

% Construct 1 degree double sequence. 
f=100;    % 100 Hz input sampling on sequence
d=0.5;      % 2 sec pulse duration
a=[1 1 1];% pulse amplitude(deg), [ele,rud,ail]

dub=[zeros(4*f*d,1);ones(f*d,1);-1*ones(f*d,1);zeros(4*f*d,1)]; % a doublet
ulin = [  [a(1)*dub;0*dub;0*dub], [0*dub;0*dub;a(3)*dub], [0*dub;a(2)*dub;0*dub] ]; % doublet sequence
tlin=[0:length(ulin)-1]/f;

% Run linear simulation
ylin=lsim(sys(:,[1,2,3]),ulin,tlin);

% Construct same doublet sequence via simulink
set_param('gtm_design/Input Generator/Doublet Generator','timeon','[2 12 7]'); 
set_param('gtm_design/Input Generator/Doublet Generator','pulsewidth','[0.5 0.5 0.5]');
set_param('gtm_design/Input Generator/Doublet Generator','amplitude',sprintf('[%f %f %f]',a(1),a(3),a(2)));
[tsim,xsim,ysim]=sim('gtm_design',[0 max(tlin)]);

% Turn simulink doublet generation off
set_param('gtm_design/Input Generator/Doublet Generator','amplitude','[0 0 0]');

% Grab state in ysim First 6 are trim outputs, next 12 are state.
ysim=ysim(:,7:18);


% Plot results
figure(1)
subplot(311),
plot(tlin,ulin(:,1)); grid on; title('Elevator Doublet');
subplot(312),
plot(tsim,ysim(:,5), tlin,ylin(:,5)+ysim(1,5)); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('q(degps)')
subplot(313),
plot(tsim,180/pi*ysim(:,11), tlin,180/pi*(ylin(:,11)+ysim(1,11))); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('theta(deg)')

figure(2)
subplot(311),
plot(tlin,ulin(:,2)); grid on; title('Aileron Doublet');
subplot(312),
plot(tsim,180/pi*ysim(:,4), tlin,180/pi*(ylin(:,4)+ysim(1,4))); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('p(degps)')
subplot(313),
plot(tsim,180/pi*ysim(:,10), tlin,180/pi*(ylin(:,10)+ysim(1,10))); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('phi(deg)')

figure(3)
subplot(311),
plot(tlin,ulin(:,3)); grid on; title('Rudder Doublet');
subplot(312),
plot(tsim,180/pi*ysim(:,4), tlin,180/pi*(ylin(:,4)+ysim(1,4))); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('r(degps)')
subplot(313),
plot(tsim,180/pi*ysim(:,10), tlin,180/pi*(ylin(:,10)+ysim(1,10))); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('psi(deg)')

figure(4)
subplot(411),
plot(tlin,ulin(:,:)); grid on; legend('Evelator','Aileron','Rudder')
title('Linear Velocities');
subplot(412),
plot(tsim,ysim(:,1), tlin,(ylin(:,1)+ysim(1,1))); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('u (ft/sec)')
subplot(413),
plot(tsim,ysim(:,2), tlin,(ylin(:,2)+ysim(1,2))); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('v (ft/sec)')
subplot(414),
plot(tsim,ysim(:,3), tlin,(ylin(:,3)+ysim(1,3))); 
grid on; legend('Simulation', 'Linear');xlabel('Time (sec)');ylabel('w (ft/sec)')


if (exist('AutoRun','var'))
    pause(.2);
    orient portrait; print -dpng exampleplot01;
end

% Print damping/frequency info for decoupled models
fprintf('\nLongitudinal Dynamics:\n');damp(londyn);
fprintf('\nLateral Dynamics:\n');damp(latdyn);


