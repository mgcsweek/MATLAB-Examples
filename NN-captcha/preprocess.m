function bounded = preprocess(i)
% 256 // SHADES OF GRAY
greyScale = rgb2gray(i);% GRAYSCALE
thresholded = greyScale < 30;% THRESHOLDING
% CLEANING - OFFSET
rows = size(thresholded, 1);% SIZE prva dimenzija
row = 1;
while (row < rows)
rowSum = sum(thresholded(row,:));
if (rowSum < 5 && rowSum > 0)
thresholded(row,:) = 0;
end
row = row + 1;
end
bb = regionprops(double(thresholded), 'BoundingBox');% BOUNDING
bounded = imcrop(thresholded, bb.BoundingBox);
end

