%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vidim plave krugove (Matlab resenje)
% (c) Nedelja informatike v2.0 (csnedelja.mg.edu.rs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
close all
warning('off','all'); % Livin' on the edge
mini = 0.5; % H kanal treshold za plavu boju
maxi = 0.7196; % H kanal treshold za plavu boju
vmin = 0.65; % V kanal treshold za bitne detalje na slici
slash = '/';
if ispc 	%Hendluje kose crte za Windows i nix
	slash = '\';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ucitavanje slike i binarizacija po H i V parametrima
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imeslike = 'test.png'; % c_1.ppm c_2.ppm c_3.ppm test.png test2.png 
slika = imread(strcat('slike',slash,imeslike));
imshow(slika)
hsv=rgb2hsv(slika); %Pretvaranje u HSV
figure,imshow(hsv(:,:,1))
figure,imshow(hsv(:,:,3))
% Binarizacija
binarno = (hsv(:,:,1) >= mini & hsv(:,:,1) <= maxi & hsv(:,:,3)>=vmin);
binarno_slika=uint8(binarno);
figure, imshow(mat2gray(binarno_slika))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Brisanje pozadine (ako je ista plava)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bojapozadine = round((binarno_slika(1,1) + binarno_slika(1,size(binarno_slika,2)) + binarno_slika(size(binarno_slika,1),1) + binarno_slika(size(binarno_slika,1),size(binarno_slika,2)))/4)
if (bojapozadine==1) % Ako je pozadina plava
    binarno = ~binarno; % Invertuje kako bi imfill radio
    if (binarno_slika(1,1)==bojapozadine)
        binarno = imfill(binarno,[1 1],8);
    elseif (binarno_slika(1,size(binarno,2))==bojapozadine)
        binarno = imfill(binarno,[1 size(binarno_slika,2)],8);
    else
        binarno = imfill(binarno,[size(binarno_slika,1) 1],8);
    end;                                                        % Proverava koja je tacka od te 4 plava da u nju lupi koficu (nedajboze case)
    binarno = ~binarno; % Vraca nazad invertovanje
    binarno_slika=uint8(binarno);
    figure, imshow(mat2gray(binarno_slika))
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Erozija i diletacija (za popravljanje ivica)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
se = strel('disk', 5);
binarno = imerode(imdilate(binarno,se), se);
binarno_slika=uint8(binarno);
figure, imshow(mat2gray(binarno_slika))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[centers,radii] = imfindcircles(binarno,[5 min(size(binarno))],'Sensitivity',0.68,'ObjectPolarity','bright');
figure, imshow(slika)
pause(2) % Hack da bi viscircles sacekao da se novi figure inicijalizuje
viscircles(centers, radii,'EdgeColor','b');





