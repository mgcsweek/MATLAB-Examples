%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Klasicna funkcija za odredjivanje da li je broj prost
% (c) Nedelja Informatike v2.0 (csweek.mg.edu.rs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function p = prost(n)
t=floor(sqrt(n));
for m = 2:t
    if mod(n,m) == 0
        p=0;
        return
    end
end;
    p=1;

end
