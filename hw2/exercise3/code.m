%read in images
%I3 and I4 were taken by me
I = imread("venice2.jpg");
I2 = imread("snow2.jpg");
I3 = imread("myimgX.jpg");
I4 = imread("myimgY.jpg");

%apply function img5 to images. img5 function explained below.
b = img5(I);
b2 = img5(I2);
b3 = img5(I3);
b4 = img5(I4);

%write to output
imwrite(b, "veince2_balanced.jpg");
imwrite(b2, "snow2_balanced.jpg");
imwrite(b3, "myimgX_balanced.jpg");
imwrite(b4, "myimgY_balanced.jpg");
%%
function balance = img5(im)
    imd = im2double(im); %convert image to double
    R = imd(:,:,1); %separate RGB values
    G = imd(:,:,2);
    B = imd(:,:,3);
    Ravg = mean2(R); %find mean of each RGB value
    Gavg = mean2(G);
    Bavg = mean2(B);
    overavg = (Ravg+Gavg+Bavg)/3; %get overall average 
    scale_R = (R/Ravg)*overavg; %apply formula to get new RGB values
    scale_G = (G/Gavg)*overavg;
    scale_B = (B/Bavg)*overavg;
    balance = cat(3,scale_R,scale_G,scale_B); %concatenate new RGB values
end