

function [u, w, q, theta, v, p, r, phi] = OutputPlot(londynA, londynB, londynC, londynD, latdynA, latdynB, latdynC, latdynD)
    
    [londynb, londyna] = ss2tf(londynA, londynB, londynC, londynD, 1);

    u = tf(londynb(1,1:end),londyna);
    w = tf(londynb(2,1:end),londyna);
    q = tf(londynb(3,1:end),londyna);
    theta = tf(londynb(4,1:end),londyna);

    [latdynb, latdyna] = ss2tf(latdynA, latdynB, latdynC, latdynD, 1);

    v = tf(latdynb(1,1:end),latdyna);
    p = tf(latdynb(2,1:end),latdyna);
    r = tf(latdynb(3,1:end),latdyna);
    phi = tf(latdynb(4,1:end),latdyna);



end