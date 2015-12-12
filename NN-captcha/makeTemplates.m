function makeTemplates()
%% NA OSNOVU 20ak slika iz training direktorije pravi templejtove
%% imena slika su charovi koji se vide na njima
templates = zeros(20,20,36); %% 20x20 TEMPLEJTOVI, 36 = brojevi + slova
counts = zeros(1,36);
trainingDir = 'training/';
trainingSamples = dir(strcat(trainingDir, '*.jpg'));
[numTrainingSamples] = size(trainingSamples);%% numTrainingSamples broj slika u trainingDir
for i=1:numTrainingSamples
filename = strcat(trainingDir, trainingSamples(i).name);
bounded = preprocess(imread(filename)); %%imread PRAVI SLIKU KAO ARRAY
chars = segment(bounded); %%SEGMENTACIJA
filename = strrep(filename, trainingDir, ''); %%vraca filename
for i=1:5 %%za svaki od 5 charova
asciiz = uint8(filename(i));%%iz ASCII char u ASCII int
if (asciiz >= 48 && asciiz <= 57) %%broj
asciiz = asciiz - 47;
elseif (asciiz >= 65 && asciiz <=90) %veliko slovo
asciiz = asciiz - 54;
else
%% NIKAD OVDE!!!
end
templates(:,:,asciiz) = templates(:,:,asciiz) + chars(:,:,i);%% dodaje char matricu
counts(asciiz) = counts(asciiz) + 1;%% broj pojavljivanja
end
end
for i=1:36
templates(:,:,i) = templates(:,:,i) / counts(i);%% normalizacija za svaki od 36 templejta
end
save('templates.mat', 'templates', 'counts');%% SAVE
end
