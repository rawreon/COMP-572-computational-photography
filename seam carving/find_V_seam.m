function array = find_V_seam(energy)
    first_row = energy(1,:);
    seam_energies = [];
   tic
    for x = 1:length(first_row)
        seam_energies = [seam_energies, SeamLinkedList(first_row(x),NaN)];
    end
    for y = 2:size(energy,1)
        bottom_row = energy(y,:);
        row_energies = [];
        for x = 1:length(bottom_row)
            x_left = max(x-1,1);
            x_right = min(x+1,length(bottom_row));
            x_range = x_left:x_right;
            
            [min_val, min_parent_x] = min([seam_energies((y-1),x_range).energy]);
            min_seam_energy = SeamLinkedList(min_val + bottom_row(x), min_parent_x + x_left -1);
            row_energies = [row_energies,min_seam_energy];
            
        end
        seam_energies = [seam_energies;row_energies];
    end
    toc
    seam = [];
    [min_seam, min_index] = min([seam_energies(end,:).energy]);
    seam_point_x = min_index;
    
    for y = size(seam_energies,1):-1:1
        seam(end+1) = seam_point_x;
        seam_point_x = seam_energies(y,seam_point_x).point_to_previous;
    end
    
    array = flip(seam);
end
