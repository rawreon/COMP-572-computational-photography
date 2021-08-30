function [result, arr] = final_v_seam_rem(img)
    array = {};
    array{end+1} = img;
    energy = dual_gradient(img);
    seamArray = find_V_seam(energy);
    show = show_seam(img, seamArray);
    array{end+1} = show;
    result = remove_seam(img,seamArray);
    array{end+1} = result;
    arr = array;
  
end

