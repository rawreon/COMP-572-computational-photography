function [before, after, gif] = seam_carving(image,img_name, width, height)
    count_width = 0;
    count_height = 0;
    image = im2double(image);
    gif_array = [];
    [y,x,z] = size(image);
    before = image;
    %prompt = "What is the name of the image? ";
    %img_name = input(prompt,'s');
    %prompt = strcat("What is the width of the final image? Initial width: ", num2str(x)," ");
    %final_width = input(prompt);
    %prompt = strcat("What is the height of the final image? Initial height: ", num2str(y)," ");
    %final_height = input(prompt);
    %height = size(image,1) - final_height;
    %width = size(image,2) - final_width;
    
    disp(["height: ", height]);
    disp(["width: ", width]);
    
    if width > 0
         for idx = 1:width
            [image,tempArr] = final_v_seam_rem(image);
            gif_array = [gif_array,tempArr];
            count_width = count_width + 1;
            disp(["count_width: ", count_width]);
            
         end
    end
    
   
    if height > 0
        for idx = 1:height
            [image,tempArr] = final_h_seam_rem(image);
            gif_array = [gif_array,tempArr];
            count_height = count_height + 1;
            disp(["count_height: ", count_height]);
        end
    end
    
    after = image;
    gif = gif_array;
    to_folder(img_name,before,after,gif_array)
end

function to_folder(img_name, before, after, gif)
    mkdir(img_name)
    pathname = strcat('./', img_name,'/');
    imwrite(before,strcat(pathname,'before.png'))
    imwrite(after, strcat(pathname,'after.png'))
    write_gif(gif, pathname)
end
