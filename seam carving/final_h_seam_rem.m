function [result,arr] = final_h_seam_rem(img)
    im_array = {};
    im_array{end+1} = img;
    img = rot90(img,-1);
    energy = dual_gradient(img);
    seamArray = find_V_seam(energy);
    show = rot90(show_seam(img, seamArray));
    im_array{end+1} = show;
    non_rotated = remove_seam(img,seamArray);
    result = rot90(non_rotated);
    im_array{end+1} = result;
    arr = im_array;
end


