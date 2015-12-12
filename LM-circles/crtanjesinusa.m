%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Crtanje sinusa i kosinusa
% (c) Nedelja informatike v2.0 (csweek.mg.edu.rs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=[0:0.1:4*pi];
plava=cos(t);
crvena=sin(t);
plot(t,plava,'b')
hold on
plot (t,crvena,'r')
