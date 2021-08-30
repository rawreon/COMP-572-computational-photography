function energy = dual_gradient(img)
    img = im2double(img);
    [y,x,z] = size(img);
    energy = zeros(y,x);
    
    for i = 1:x
        for j = 1:y
            energy(j,i) = dgCalc(i,j,x,y,img);
          
        end
    end
   
end

function dual_gradient = dgCalc(i,j,x,y, img)
   x1 = i - 1;
   x2 = i + 1;
   y1 = j - 1;
   y2 = j + 1;
   if x1 <= 0
       x1 = x;
   end
   if x2 > x
       x2 = 1;
   end
   if y1 <= 0
       y1 = y;
   end
   if y2 > y
       y2 = 1;
   end
   %Rx = img(j,x1,1) - img(j,x2,1);
   %Gx = img(j,x1,2) - img(j,x2,2);
   %Bx = img(j,x1,3) - img(j,x2,3);
   img_x = (img(j,x1,1) - img(j,x2,1))^2 + (img(j,x1,2) - img(j,x2,2))^2 + (img(j,x1,3) - img(j,x2,3))^2;
   img_y = (img(y1,i,1) - img(y2,i,1))^2 + (img(y1,i,2) - img(y2,i,2))^2 + (img(y1,i,3) - img(y2,i,3))^2;
   dual_gradient = sqrt(img_x + img_y);
end