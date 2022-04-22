function sorted_image_arrays = sort_images(image_cell_array)
% Sorts the images into predetermined clusters:
%   outdoor scenes, portraits, skies, flowers, etc...
%   outputs cell arrays containing image file paths

% First extract feature vector for each image and augment into 1 matrix
all_image_features = [];
% Image dimensions to compress to
n = 64;
m = 64;
for i = 1:length(image_cell_array)
    img = imread(image_cell_array{i});
    all_image_features(i,:) = extractFeatures(img, n, m);
end


% Perform k-means to sort images in clusters
k = 5;
clustered_imgs = KMeansClustering(all_image_features, 5);

index = find(clustered_imgs == 1);
outdoor_imgs = image_cell_array(index);

index = find(clustered_imgs == 2);
portrait_imgs = image_cell_array(index);

index = find(clustered_imgs == 3);
skies = image_cell_array(index);

index = find(clustered_imgs == 4);
flowers = image_cell_array(index);

% ADD MORE CATEGORIES
sorted_image_arrays = {outdoor_imgs, portrait_imgs, skies, flowers};

end

