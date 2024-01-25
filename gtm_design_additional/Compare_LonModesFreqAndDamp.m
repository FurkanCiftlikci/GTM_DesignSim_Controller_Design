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
  [wn,z]=damp(lon);
  % Just assuming frequency seperation here...
  phugoid(trimpt,:)     = [wn(1)/2/pi,z(1)];
  shortperiod(trimpt,:) = [wn(3)/2/pi,z(3)];
end
fprintf(' Done\n');

% Make alpha trim point plot
figure(1),clf
subplot(221),plot(Gamma,phugoid(:,1),'-s'),grid on
title('Phugoid Mode wrt Gamma');ylabel('Frequency (Hz)');xlabel('Gamma (deg)');

subplot(223),plot(Gamma,phugoid(:,2),'-s'),grid on
title('Phugoid Mode wrt Gamma');ylabel('Damping (\zeta)');xlabel('Gamma (deg)');

subplot(222),plot(Gamma,shortperiod(:,1),'-s'),grid on
title('Short-Period Mode wrt Gamma');ylabel('Frequency (Hz)');xlabel('Gamma (deg)');

subplot(224),plot(Gamma,shortperiod(:,2),'-s'),grid on
title('Short-Period Mode wrt Gamma');ylabel('Damping (\zeta)');xlabel('Gamma (deg)');

%% EAS
Eas=[70:5:110];

% Allocate memory
shortperiod = zeros(length(Eas),2);
phugiod     = zeros(length(Eas),2);

% Comute Trim points
loadmws(init_design(),'gtm_design');
fprintf('  Trimming/Linearizing at alpha:\n');
for trimpt=[1:length(Eas)]
  fprintf(1,'      %3.2f,',Eas(trimpt));
  [MWS,Xt,Tc,Err]=trimgtm( struct('eas',Eas(trimpt),'gamma',0),[],0);
  fprintf(1,' Residual=%3.2e\n',Err);
  loadmws(MWS,'gtm_design'); 
  [sys,lon,lat]=linmodel(MWS);
  [wn,z]=damp(lon);
  % Just assuming frequency seperation here...
  phugoid(trimpt,:)     = [wn(1)/2/pi,z(1)];
  shortperiod(trimpt,:) = [wn(3)/2/pi,z(3)];
end
fprintf(' Done\n');

% Make alpha trim point plot
figure(2),clf
subplot(221),plot(Eas,phugoid(:,1),'-s'),grid on
title('Phugoid Mode wrt EAS');ylabel('Frequency (Hz)');xlabel('EAS (knot)');

subplot(223),plot(Eas,phugoid(:,2),'-s'),grid on
title('Phugoid Mode wrt EAS');ylabel('Damping (\zeta)');xlabel('EAS (knot)');

subplot(222),plot(Eas,shortperiod(:,1),'-s'),grid on
title('Short-Period Mode wrt EAS');ylabel('Frequency (Hz)');xlabel('EAS (knot)');

subplot(224),plot(Eas,shortperiod(:,2),'-s'),grid on
title('Short-Period Mode wrt EAS');ylabel('Damping (\zeta)');xlabel('EAS (knot)');