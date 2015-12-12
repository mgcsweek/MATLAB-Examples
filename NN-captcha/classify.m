function [decoded confidence] = classify(chars)
% vraca confidence i string ocitanih karaktera
load templates;
warning off MATLAB:divideByZero
decoded = char(zeros(1,5));
confidence = 1.0; % pocetni confidence(krajnji = product 5 corra)
for i=1:5 % za svaki char
allCorrs = zeros(1, 36);
for j=1:36 % za svaki templejt
temp = templates(:,:,j);
in = chars(:,:,i);
allCorrs(j) = corr2(temp, in); % CORRCOEF za [char,templejt]
end
index = find(allCorrs == max(allCorrs), 1); % najvece poklapanje
confidence = max(allCorrs) * confidence;
% prebacuje iz indeksa
if (index <= 10) % broj
index = index + 47;
elseif (index >= 11 && index <= 36)% slovo
index = index + 54;
else
% nikad
end
decoded(i) = char(index);
end
end

