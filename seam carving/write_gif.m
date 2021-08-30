function write_gif(gif_array,pathname)
    filename = 'process.gif'; % Specify the output file name
    path = strcat(pathname,filename);
    for idx = 1:length(gif_array)
        [A,map] = rgb2ind(gif_array{idx},256);
        if idx == 1
            imwrite(A,map,path,'gif','LoopCount',Inf,'DelayTime',.001);
        else
            imwrite(A,map,path,'gif','WriteMode','append','DelayTime',.001);
        end
    end
end