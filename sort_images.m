function sorted_image_arrays = sort_images(image_cell_array)
% Sorts the images into predetermined clusters:
%   outdoor scenes, portraits, skies, flowers, etc...
%   outputs cell arrays containing image file paths


outdoor_imgs = {};
portrait_imgs = {};
skies = {};
flowers = {};
% ADD MORE CATEGORIES
sorted_image_arrays = {outdoor_imgs, portrait_imgs, skies, flowers};

end

