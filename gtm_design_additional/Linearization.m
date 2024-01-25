close all; clear; clc;
%% Linearization
Gamma=[-3:1:3];
Speed = [60:5:80];
Altitude = [300:100:500];

fprintf('  Trimming/Linearizing at Gamma:\n');

for trimptGamma=[1:length(Gamma)]
    for trimptSpeed=[1:length(Speed)]
        for trimptAltitude=[1:length(Altitude)]
            loadmws(seteomic(init_design(),'alt',Altitude(trimptAltitude)),'gtm_design'); % Assign Altitude
            
            fprintf(1,'Alt = %3.2f // Gamma = %3.2f // Speed = %3.2f,',Altitude(trimptAltitude),Gamma(trimptGamma),Speed(trimptSpeed));
            %% Trimming
            [MWS,Xt,Tc,Err]=trimgtm( struct('pdeg',0,'qdeg',0,'rdeg',0,'beta',0,'eas',Speed(trimptSpeed),'gamma',Gamma(trimptGamma)),'elev',0);
            fprintf(1,' Residual=%3.2e\n',Err);
            %% Linearization
            loadmws(MWS,'gtm_design');
            [sys,lon,lat]=linmodel(MWS,1,0);
            %% Store Current Trim
            linear_model.Longitudinal = lon;
            linear_model.Lateral = lat;
            linear_model.System = sys;
            linear_model.TrimCond = Tc;
            %% Store All Trim
            LinearAll(trimptAltitude,trimptSpeed,trimptGamma) = linear_model;
        end
    end
end

save(strcat(['LinearModels']),'LinearAll');