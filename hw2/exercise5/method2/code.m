%read in images
%I took all these images myself
I = imread("myimgP.jpg");
I2 = imread("myimgQ.jpg");
I3 = imread("myimgR.jpg");

%apply filter to images
t1 = img(I);
t2 = img(I2);
t3 = img(I3);
%show image before and after image side by side
imshowpair(I,t1,"montage");
imshowpair(I2,t2,"montage");
imshowpair(I3,t3,"montage");

%write to output
imwrite(t1,"myimgP_filter.jpg");
imwrite(t2,"myimgQ_filter.jpg");
imwrite(t3,"myimgR_filter.jpg");
%%
function bw = img(I)
    c = histeq(I); %adjust contrast on image
    hsv = rgb2hsv(c); %convert to hsv and separate values
    H = hsv(:,:,1);
    S = hsv(:,:,2);
    V = hsv(:,:,3);
    test = cat(3,H,S*1.5,V); %concatenate hsv, increase saturation
    test2 = hsv2rgb(test); %convert hsv back to rgb
    R = test2(:,:,1); %separate RGB values
    G = test2(:,:,2);
    B = test2(:,:,3);
    bw = cat(3,R,G*1.2,B); %concatenate RGB, increase green
end 