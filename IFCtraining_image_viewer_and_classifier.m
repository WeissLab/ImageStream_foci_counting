clear all;

foldername = '/Users/laurencelefrancois/Dropbox/Flow-based imaging/Label_pilot/Labelling_53BP1';
filename = '18_untreated_9_all_ch4.tif';

load record.mat; %It doesn't make it possible to keep writing in the same document : it deletes the data previously taken

start_image =801;
max_image = 1000;

for im_number = start_image:max_image
frame_data = imread([foldername,'/',filename],'index',im_number);
imagesc(frame_data);
axis image;
title(im_number);
colormap("gray");
colorbar;
% pause;
[col,row,button] = ginput;
good_image(im_number,1) = any([max(button)==103,isempty(button)]); %If good use G(103), if bad use B(98)
    if good_image(im_number,1) == false
        number_of_points(im_number,1)=0;
    else
        number_of_points(im_number,1) = numel(row);
    end
button_saved{im_number} = button;
%good_image{im_number,1} = button;
%B= cell2mat(good_image);
col_saved{im_number} = col;
row_saved{im_number} = row;
end

saved_data = [good_image,number_of_points];
tabledata = array2table(saved_data);
tabledata.Properties.VariableNames(1:2) = {'Good image','Number of foci'};

save('record.mat','saved_data','col_saved','row_saved','button_saved');