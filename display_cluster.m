function display_cluster(img_cluster, plot_title, save)
% Display subplot of all images in a given cluster

    num_images = length(img_cluster);
    x = ceil(sqrt(num_images));
    y = ceil(num_images/x);
    fig1 = figure;
    images = {};
    for i = 1:num_images
        %subplot(x,y,i)
        image = imread(img_cluster{i});
        images(i) = {image}; 
        %imshow(image);
    end
    montage(images)
    title(plot_title)

    if save
        filename = strcat('./clustered_images/', plot_title, '.jpg');
        saveas(fig1, filename);
    end
end

