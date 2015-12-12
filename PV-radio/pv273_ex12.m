% Petar 'PetarV' Velickovic
% mgcsweek v2.0
% MATLAB kroz primere: IQ sampling i FM demodulacija

% PARAMETERS
f_sample = 240000;
f_filter = 16000;
f_output = 48000;

% READ IQ DATA
f = fopen('iq-fm-96M-240k.dat', 'r', 'ieee-le');
c = fread(f, [2, inf], '*float32');
fclose(f);

I = c(1,:);
Q = c(2,:);

% FM DEMODULATION
angles = atan2(Q, I);
d_alpha = diff(angles);
X = unwrap(d_alpha) * f_sample;

% LOW-PASS FILTER
Wn = f_filter / (0.5 * f_sample);
[b, a] = butter(5, Wn, 'low'); 
f_X = filter(b, a, X);

% DOWNSAMPLE, NORMALISE
f_X_down = f_X(1:5:end);
f_X_norm = f_X_down / max(f_X_down);
audiowrite('radio_out.wav', f_X_norm, f_output);
