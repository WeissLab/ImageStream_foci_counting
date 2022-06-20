
foldername = '/Users/laurencelefrancois/Dropbox/Flow-based imaging/Label_pilot/Labelling_53BP1';
filename = '18_untreated_9_all_ch4.tif';

for im_number = 1:1000
    frame_data = imread([foldername,'/',filename],'index',im_number);
    if untreated9allch4(im_number,1) == 1 && untreated9allch4(im_number,2)== 0
        imwrite(frame_data,'18_untreated_9_all_ch4_good_images.tif','writemode','append');
    end
end