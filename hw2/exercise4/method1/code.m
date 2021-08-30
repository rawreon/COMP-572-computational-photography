%read in images
%I3 and I4 were taken by me
I = imread("venice3.jpg");
I2 = imread("snow3.jpg");
I3 = imread("myimgC.jpg");
I4 = imread("myimgD.jpg");

%convert images to double
Id = im2double(I);
Id2 = im2double(I2);
Id3 = im2double(I3);
Id4 = im2double(I4);

%look at histogram to find thresholds
imhist(Id);
imhist(Id2);
imhist(Id3);
imhist(Id4);

%apply img function. img function explained below.
%displays image after function with its histogram.
Icon = img(Id,0.2,0.5);
figure(1);
subplot(1,2,1), imshow(Icon);
subplot(1,2,2), imhist(Icon);

Icon2 = img(Id2, 0.5, 0.95);
figure(2);
subplot(1,2,1), imshow(Icon2);
subplot(1,2,2), imhist(Icon2);

Icon3 = img(Id3, 0.32, 0.43);
figure(3);
subplot(1,2,1), imshow(Icon3);
subplot(1,2,2), imhist(Icon3);

Icon4 = img(Id4,0.38, 0.67);
figure(4);
subplot(1,2,1), imshow(Icon4);
subplot(1,2,2), imhist(Icon4);

%write image to outpute
imwrite(Icon, "venice3_contrast.jpg");
imwrite(Icon2, "snow3_contrast.jpg");
imwrite(Icon3, "myimgC_contrast.jpg");
imwrite(Icon4, "myimgD_contrast.jpg");
%%
function contrast = img(im,low,high) %takes in image, as well as manually obtained threshold values
    imhsv = rgb2hsv(im); %converts to hsv
    H = imhsv(:,:,1); %separate hsv values
    S = imhsv(:,:,2);
    V = imhsv(:,:,3);
    newV = imadjust(V,[low,high],[0,1]); %adjust intensity value with thresholds.
    highContrast = cat(3,H,S,newV); %concatenate hsv with new intensity value;
    contrast = hsv2rgb(highContrast); %convert back to rgb
end