%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testbench za brzinu racunanja velikog prostog broja
% (c) Nedelja Informatike v2.0 (csweek.mg.edu.rs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Nasa f-ja')
tic 
prost(32416190071)
toc
disp('Matlab f-ja')
tic
isprime(32416190071)
toc
