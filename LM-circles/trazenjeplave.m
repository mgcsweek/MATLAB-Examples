%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trazenje tresholda za plavu boju
% (c) Nedelja Informatike v2.0 (csweek.mg.edu.rs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc
slash = '/';
if ispc 	%Hendluje kose crte za Windows i nix
	slash = '\';
end
duga = imread(strcat('slike',slash,'rainbow1.png'));

hsv=rgb2hsv(duga);
h=hsv(:,:,1);
imshow(duga);
figure
imshow(h)
mini = h(132,1) % 0.4477
maxi = h(210,1) % 0.7196

dugamaska = uint8((h >= mini & h <= maxi));
dugaizd = duga;
dugaizd(:,:,1)=dugaizd(:,:,1).*dugamaska;
dugaizd(:,:,2)=dugaizd(:,:,2).*dugamaska;
dugaizd(:,:,3)=dugaizd(:,:,3).*dugamaska;
figure
imshow(dugaizd)

pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Provera na full spektru
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
duga = imread(strcat('slike',slash,'spectrum.png'));
figure, imshow(duga)
hsv=rgb2hsv(duga);
h=hsv(:,:,1);
dugamaska = uint8((h >= mini & h <= maxi));
dugaizd = duga;
dugaizd(:,:,1)=dugaizd(:,:,1).*dugamaska;
dugaizd(:,:,2)=dugaizd(:,:,2).*dugamaska;
dugaizd(:,:,3)=dugaizd(:,:,3).*dugamaska;
figure
imshow(dugaizd)

