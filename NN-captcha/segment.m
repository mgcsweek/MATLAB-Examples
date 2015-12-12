function [retVal] = segment(bounded)
retVal = zeros(20, 20, 5); % 5 charova 20x20 size
[rows cols] = size(bounded);
col=3;
startCol = 1;
charIndex = 1;
while(col < cols) % do kraja slike
col = col + 10;
while (col+2 <= cols) && (sum(sum(bounded(:,col:col+2))) > 0)% dok nije prazna kolona
col = col + 1;
end
a = imcrop(bounded, [startCol 1 (col - startCol) rows]);% koordinate pravougaonika
% Pad out to 20 rows and 20 cols with 0's
[charRows charCols] = size(a);
a = padarray(a, [(20 - charRows) (20 - charCols)], 'post');
retVal(:,:,charIndex) = a;
charIndex = charIndex + 1;
col = col + 1;
startCol = col;
% Napred dok je belo
while (col <= cols) && (sum(sum(bounded(:,col))) == 0)
col = col + 1;
startCol = startCol + 1;
end
end
end

