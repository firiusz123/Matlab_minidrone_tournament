clear all
close all 
mask_struct = open("image_data_mask.mat");
image_struct = open("image_data.mat");
%%
mask_img = mask_struct.out.image_data_masked;
whole_img =  mask_struct.out.image_data;
%%
% Binary mask for the current frame
BW = mask_img(:,:,30);  % Use the desired slice index

% Extract boundaries from the binary mask
boundaries = bwboundaries(BW);

% Combine all contour points into a single array (more efficient)
contour_points = vertcat(boundaries{:});

% Downsample the contour points to create waypoints
downsample_rate = 10;  % Adjust for waypoint density
waypoints_2d = contour_points(1:downsample_rate:end, :);

% Step 1: Display the binary mask
figure(1)
imshow(BW);
title('Binary Mask');
xlabel('X'); ylabel('Y');

% Step 2: Overlay the waypoints
figure(2)
imshow(BW);
hold on;

% Plot all boundaries in white in a single operation
cellfun(@(boundary) plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2), boundaries);

% Plot the downsampled waypoints in red
plot(waypoints_2d(:,2), waypoints_2d(:,1), 'ro', 'MarkerSize', 6, 'LineWidth', 1.5);

% Add title and labels
title('Waypoints Overlayed on Binary Mask');
xlabel('X'); ylabel('Y');
hold off;
