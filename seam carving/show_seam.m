function image = show_seam(img, array)
    for y = 1:size(img,1)
        img(y,array(y),1) = 1;
        img(y,array(y),2) = 0;
        img(y,array(y),3) = 0;
    end
    image = img;
end