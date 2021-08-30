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

%apply histeq() function to each image.
%display image after function alongside its histogram.
Icon = histeq(Id);
figure(1);
subplot(1,2,1), imshow(Icon);
subplot(1,2,2), imhist(Icon);

Icon2 = histeq(Id2);
figure(2);
subplot(1,2,1), imshow(Icon2);
subplot(1,2,2), imhist(Icon2);

Icon3 = histeq(Id3);
figure(3);
subplot(1,2,1), imshow(Icon3);
subplot(1,2,2), imhist(Icon3);

Icon4 = histeq(Id4);
figure(4);
subplot(1,2,1), imshow(Icon4);
subplot(1,2,2), imhist(Icon4);

%write to output
imwrite(Icon, "venice3_contrast.jpg");
imwrite(Icon2, "snow3_contrast.jpg");
imwrite(Icon3, "myimgC_contrast.jpg");
imwrite(Icon4, "myimgD_contrast.jpg");