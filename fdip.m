function [B,C] = fdip(A,na,m,ro,gg);
[B0,C0]=gradient(A.^2,gg)
B=B0*pi*na^2*8.8e-12*ro^3*(m^2-1)/(m^2+2);
C=C0*pi*na^2*8.8e-12*ro^3*(m^2-1)/(m^2+2)
