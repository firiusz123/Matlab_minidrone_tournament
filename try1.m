clear all
close all 
mask_struct = open("image_data_mask.mat");
image_struct = open("image_data.mat");
%%
mask_img = mask_struct.out.image_data_masked;
whole_img =  mask_struct.out.image_data;
%%
figure(1);
for i = 1:101
    imshow(whole_img(:,:,:,i));  % Added the closing parenthesis
    pause(0.2);  % Pauses for 0.2 seconds before showing the next frame
end