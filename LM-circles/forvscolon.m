%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Poredjenje brzine for petlje i Colon notacije
% (c) Nedelja Informatike v2.0 (csnedelja.mg.edu.rs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A=[0:0.1:1];
B=sin(A);
tic
C=B(1:5);
toc
tic
D=[]; for (i=1:5) D=[D,B(i)]; end; D ;
toc
