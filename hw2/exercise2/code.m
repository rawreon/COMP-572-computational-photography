%read in images
%I and I2 were taken by me
I = imread("myimgA.jpg");
I2 = imread("myimgB.jpg");
I3 = imread("snow1.jpg");
I4 = imread("venice1.jpg");

%apply img4 function to images. img4 function explained below.
sep = img4(I);
sep2 = img4(I2);
sep3 = img4(I3);
sep4 = img4(I4);

%show images before and after function
imshowpair(I,sep,"montage")
imshowpair(I2,sep2,"montage")
imshowpair(I3,sep3,"montage")
imshowpair(I4,sep4,"montage")

%write image to output
imwrite(sep, "myimgA_sepia.jpg");
imwrite(sep2, "myimgB_sepia.jpg");
imwrite(sep3, "snow1_sepia.jpg");
imwrite(sep4, "venice1_sepia.jpg");
%%
function sepia = img4(im)
    I = im2double(im); %convert image to double
    red = I(:,:,1); %separate RGB values
    green = I(:,:,2);
    blue = I(:,:,3);
    sepia_r = red*0.393 + green*0.769 + blue*0.189; %obtain new RGB values through formula
    sepia_g = red*0.349 + green*0.686 + blue*0.168;
    sepia_b = red*0.272 + green*0.534 + blue*0.131;
    sepia = cat(3, sepia_r, sepia_g, sepia_b); %concatenate new RGB values to get image
end