function result = remove_seam(img,array)
    temp2 = [];
    for y = 1:size(img,1)
        temp = img(y,:,:);
        temp(:,array(y),:) = [];
        temp2 = [temp2;temp];
    end
    result = temp2;
end