%read in images
%I took all these images myself
I = imread("myimgQ.jpg");
I2 = imread("myimgP.jpg");
I3 = imread("myimgR.jpg");

%apply filter to images
%show image before and after filter side by side
test = img(I);
imshowpair(I,test,'montage');

test2 = img(I2)
imshowpair(I2, test2,'montage')

test3 = img(I3)
imshowpair(I3, test3,'montage')

%write to output
imwrite(test,"myimgQ_filter.jpg");
imwrite(test2,"myimgP_filter.jpg");
imwrite(test3,"myimgR_filter.jpg")

%%
function vignette = img(im)
    Id = im2double(im); %convert image to double
    hsv = rgb2hsv(Id); %convert hsv and separate hsv 
    H = hsv(:,:,1);
    S = hsv(:,:,2);
    V = hsv(:,:,3);
    test = hsv2rgb(cat(3,H,S*1.2,V+0.25)); %combine hsv while increasing saturation and intensity
    sz = size(Id); %find dim of image
    gauss = fspecial("gaussian",[sz(1),sz(2)],sz(1)/2.7); %create gaussian
    gauss = gauss / max(gauss(:)); %normalize gaussian
    vignette = test .* gauss; %apply gaussian multiplier
end