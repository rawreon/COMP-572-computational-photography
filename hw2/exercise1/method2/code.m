%read in images
%I and I2 were taken by me
I = imread("myimg1.jpg");
I2 = imread("myimg2.jpg");
I3 = imread("snow1.jpg");
I4 = imread("venice1.jpg");

%convert images to double
Idouble = im2double(I);
I2double = im2double(I2);
I3double = im2double(I3);
I4double = im2double(I4);

%apply my img function to images. function explained below
gs = img(Idouble);
gs2 = img(I2double);
gs3 = img(I3double);
gs4 = img(I4double);

%display images before and after function
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
function gray = img(I)
    R = I(:,:,1); %separate RGB values
    G = I(:,:,2);
    B = I(:,:,3);
    gray = (R+G+B)/3; %Add RGB values and divide by 3
end