% Talha Ulukır
%% Gamma
Gamma=[-3:1:+3];

% Allocate memory
shortperiod = zeros(length(Gamma),2);
phugiod     = zeros(length(Gamma),2);

% Comute Trim points
loadmws(init_design(),'gtm_design');
fprintf('  Trimming/Linearizing at alpha:\n');
for trimpt=[1:length(Gamma)],
  fprintf(1,'      %3.2f,',Gamma(trimpt));
  [MWS,Xt,Tc,Err]=trimgtm( struct('eas',80,'gamma',Gamma(trimpt)),[],0);
  fprintf(1,' Residual=%3.2e\n',Err);
  loadmws(MWS,'gtm_design'); 
  [sys,lon,lat]=linmodel(MWS);
  [wn,z]=damp(lat);
  % Just assuming frequency seperation here...
  spiral(trimpt,:)     = [wn(1)/2/pi,z(1)];
  dutchroll(trimpt,:) = [wn(2)/2/pi,z(2)];
  roll(trimpt,:) = [wn(4)/2/pi,z(4)];
end
fprintf(' Done\n');

% Make alpha trim point plot
figure(1),clf
subplot(231),plot(Gamma,spiral(:,1),'-s'),grid on
title('Spiral Mode wrt Gamma');ylabel('Frequency (Hz)');xlabel('Gamma (deg)');

subplot(234),plot(Gamma,spiral(:,2),'-s'),grid on
title('Spiral Mode wrt Gamma');ylabel('Damping (\zeta)');xlabel('Gamma (deg)');

subplot(232),plot(Gamma,dutchroll(:,1),'-s'),grid on
title('Dutch Roll Mode wrt Gamma');ylabel('Frequency (Hz)');xlabel('Gamma (deg)');

subplot(235),plot(Gamma,dutchroll(:,2),'-s'),grid on
title('Dutch Roll Mode wrt Gamma');ylabel('Damping (\zeta)');xlabel('Gamma (deg)');

subplot(233),plot(Gamma,roll(:,1),'-s'),grid on
title('Roll Mode wrt Gamma');ylabel('Frequency (Hz)');xlabel('Gamma (deg)');

subplot(236),plot(Gamma,roll(:,2),'-s'),grid on
title('Roll Mode wrt Gamma');ylabel('Damping (\zeta)');xlabel('Gamma (deg)');

%% EAS
Eas=[70:5:110];

% Allocate memory
shortperiod = zeros(length(Eas),2);
phugiod     = zeros(length(Eas),2);

% Comute Trim points
loadmws(init_design(),'gtm_design');
fprintf('  Trimming/Linearizing at alpha:\n');
for trimpt=[1:length(Eas)],
  fprintf(1,'      %3.2f,',Eas(trimpt));
  [MWS,Xt,Tc,Err]=trimgtm( struct('eas',Eas(trimpt),'gamma',0),[],0);
  fprintf(1,' Residual=%3.2e\n',Err);
  loadmws(MWS,'gtm_design'); 
  [sys,lon,lat]=linmodel(MWS);
  [wn,z]=damp(lat);
  % Just assuming frequency seperation here...
  spiral(trimpt,:)     = [wn(1)/2/pi,z(1)];
  dutchroll(trimpt,:) = [wn(2)/2/pi,z(2)];
  roll(trimpt,:) = [wn(4)/2/pi,z(4)];
end
fprintf(' Done\n');

% Make alpha trim point plot
figure(2),clf
subplot(231),plot(Eas,spiral(:,1),'-s'),grid on
title('Spiral Mode wrt Gamma');ylabel('Frequency (Hz)');xlabel('EAS (knot)');

subplot(234),plot(Eas,spiral(:,2),'-s'),grid on
title('Spiral Mode wrt Gamma');ylabel('Damping (\zeta)');xlabel('EAS (knot)');

subplot(232),plot(Eas,dutchroll(:,1),'-s'),grid on
title('Dutch Roll Mode wrt Gamma');ylabel('Frequency (Hz)');xlabel('EAS (knot)');

subplot(235),plot(Eas,dutchroll(:,2),'-s'),grid on
title('Dutch Roll Mode wrt Gamma');ylabel('Damping (\zeta)');xlabel('EAS (knot)');

subplot(233),plot(Eas,roll(:,1),'-s'),grid on
title('Roll Mode wrt Gamma');ylabel('Frequency (Hz)');xlabel('EAS (knot)');

subplot(236),plot(Eas,roll(:,2),'-s'),grid on
title('Roll Mode wrt Gamma');ylabel('Damping (\zeta)');xlabel('EAS (knot)');