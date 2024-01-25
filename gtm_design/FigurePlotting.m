function plotting = FigurePlotting(londynA, londynB, londynC, londynD, latdynA, latdynB, latdynC, latdynD)

[u, w, q, theta, v, p, r, phi] = OutputPlot(londynA, londynB, londynC, londynD, latdynA, latdynB, latdynC, latdynD);

figure()
[u,t] = step(u);
subplot(2,2,1)
plot(t,u,'Color','red')
title('U');
grid on; hold on;

[w,t] = step(w);
subplot(2,2,2)
plot(t,w,'Color','green')
title('W');
grid on; hold on;

[q,t] = step(q);
subplot(2,2,3)
plot(t,q,'Color','blue')
title('Q');
grid on; hold on;

[theta,t] = step(theta);
subplot(2,2,4)
plot(t,theta,'Color','cyan')
title('THETA');
grid on; hold on;

sgt = sgtitle('Langitudinal','Color','red');
sgt.FontSize = 20;
set(findall(gcf,'type','line'),'linewidth',2);



figure()
[v,t] = step(v);
subplot(2,2,1)
plot(t,v,'Color','red')
title('V');
grid on; hold on;

[p,t] = step(p);
subplot(2,2,2)
plot(t,p,'Color','green')
title('P');
grid on; hold on;

[r,t] = step(r);
subplot(2,2,3)
plot(t,r,'Color','blue')
title('R');
grid on; hold on;

[phi,t] = step(phi);
subplot(2,2,4)
plot(t,phi,'Color','cyan')
title('PHİ');
grid on; hold on;

sgt = sgtitle('Lateral','Color','red');
sgt.FontSize = 20;


set(findall(gcf,'type','line'),'linewidth',2);