function [decoded confidence] = recognize(imageFileName)
% napravi templejtove ako ih vec nema
if (exist('templates.mat', 'file') == 0)
fprintf('Training templates do not exist. Creating them now...');
makeTemplates();
fprintf('DONE\n');
end
preprocessed = preprocess(imread(imageFileName));
segmented = segment(preprocessed);
[decoded confidence] = classify(segmented);
end
