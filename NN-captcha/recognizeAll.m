function recognizeAll()
testingDir = 'testing/';
testingSamples = dir(strcat(testingDir, '*.jpg'));
numTestingSamples = size(testingSamples, 1);
charCorrect = 0;
charWrong = 0;
hipCorrect = 0;
confidences = zeros(1, numTestingSamples);
tic % meri vreme
for i=1:numTestingSamples %za svaku test sliku
fn = strcat(testingDir, testingSamples(i).name);
[chars c] = recognize(fn);
confidences(i) = c;
fn = strrep(fn, testingDir, '');
fn = strrep(fn, '.jpg', '');
% ispis rezultata
fprintf('Actual: %s Decoded: %s Confidence: %f', fn, chars, c);
if (strcmp(fn, chars) == 0)
fprintf(' Incorrect\n');
else
fprintf(' Correct\n');
hipCorrect = hipCorrect + 1;
end
for j=1:5
%poredi dobijeni sa stvarnim rezultatom
if (strcmp(fn(j), chars(j)) == 0)
charWrong = charWrong + 1;
else
charCorrect = charCorrect + 1;
end
end
end
toc
%ispis rezultata
charAcc = charCorrect / (charCorrect + charWrong);
hipAcc = hipCorrect / numTestingSamples;
avgConfidence = sum(confidences) / numTestingSamples;
minConfidence = min(confidences);
fprintf('Character Accuracy: %f\n', charAcc);
fprintf('HIP Accuracy: %f\n', hipAcc);
fprintf('Average confidence: %f\n', avgConfidence);
fprintf('Minimum confidence: %f\n', minConfidence);
end


























