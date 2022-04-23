function sorted_image_arrays = sort_images(image_cell_array)
% Sorts the images into predetermined clusters:
%   outdoor scenes, portraits, skies, flowers, etc...
%   outputs cell arrays containing image file paths

% First extract feature vector for each image and augment into 1 matrix
all_image_features = [];
% Image dimensions to compress to
n = 20;
m = 20;
n2 = 128;
m2 = 128;
for i = 1:length(image_cell_array)
    img = imread(image_cell_array{i});
    all_image_features(i,:) = extractFeatures(img, n, m, n2, m2);
end

% Compress data using PCA
% Rows are observations, Data are columns
% [~,compressed_image_features,~,~,~] = pca(all_image_features);
compressed_image_features = all_image_features;
% Perform k-means to sort images in clusters
k = 6;

centers = zeros(k,size(compressed_image_features,2));
centers(1,:) = compressed_image_features(strcmpi(image_cell_array, {'./images/IMG_20180713_143820.jpg'}), :);
centers(2,:) = compressed_image_features(strcmpi(image_cell_array , {'./images/20160706_121528.jpg'}), :);
centers(3,:) = compressed_image_features(strcmpi(image_cell_array , {'./images/paris_general_000061.jpg'}), :);
centers(4,:) = compressed_image_features(strcmpi(image_cell_array , {'./images/0105.jpg'}), :);
centers(5,:) = compressed_image_features(strcmpi(image_cell_array , {'./images/MVIMG_20180709_193040.jpg'}), :);

clustered_imgs = KMeansClustering(compressed_image_features, k, centers);

index = find(clustered_imgs == 1);
rocky_imgs = image_cell_array(index);

index = find(clustered_imgs == 2);
greenery_imgs = image_cell_array(index);

index = find(clustered_imgs == 3);
traveling = image_cell_array(index);

index = find(clustered_imgs == 4);
bw = image_cell_array(index);


index = find(clustered_imgs == 5);
shrubbery = image_cell_array(index);

% index = find(clustered_imgs == 6);
% greenmountain = image_cell_array(index);

% ADD MORE CATEGORIES
sorted_image_arrays = {rocky_imgs, greenery_imgs, traveling, bw, shrubbery};

end

