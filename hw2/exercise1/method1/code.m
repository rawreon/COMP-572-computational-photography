%read in images
%I and I2 were taken by me
I = imread("myimg1.jpg");
I2 = imread("myimg2.jpg");
I3 = imread("snow1.jpg");
I4 = imread("venice1.jpg");

%convert to greyscale using function
gs = rgb2gray(I);
gs2 = rgb2gray(I2);
gs3 = rgb2gray(I3);
gs4 = rgb2gray(I4);

%show image before and after converting to greyscale
imshowpair(I,gs,"montage");
imshowpair(I2,gs2,"montage")
imshowpair(I3,gs3,"montage")
imshowpair(I4,gs4,"montage")

%write to output
imwrite(gs, "myimg1_gray.jpg");
imwrite(gs2, "myimg2_gray.jpg");
imwrite(gs3, "snow1_gray.jpg");
imwrite(gs4, "venice1_gray.jpg");