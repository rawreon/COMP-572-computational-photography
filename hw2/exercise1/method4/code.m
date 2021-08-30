%read in images
%I and I2 were taken by me
I = imread("myimg1.jpg");
I2 = imread("myimg2.jpg");
I3 = imread("snow1.jpg");
I4 = imread("venice1.jpg");

%convert image to double
Idouble = im2double(I);
I2double = im2double(I2);
I3double = im2double(I3);
I4double = im2double(I4);

%apply img3 function to image. im3 function explained below
gs = img3(Idouble);
gs2 = img3(I2double);
gs3 = img3(I3double);
gs4 = img3(I4double);

%show image before and after function
imshowpair(I,gs,"montage");
imshowpair(I2,gs2,"montage")
imshowpair(I3,gs3,"montage")
imshowpair(I4,gs4,"montage")

%write to output
imwrite(gs, "myimg1_gray.jpg");
imwrite(gs2, "myimg2_gray.jpg");
imwrite(gs3, "snow1_gray.jpg");
imwrite(gs4, "venice1_gray.jpg");

%%
function gray = img3(I)
    hsv = rgb2hsv(I); %convert image to hsv
    hsv(:,:,2) = hsv(:,:,2) * 0; %set saturation to 0
    gray = hsv2rgb(hsv); %convert back to rgb from hsv
end