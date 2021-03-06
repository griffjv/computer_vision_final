function featureVector = extractFeatures(img, n, m, n2, m2)
    imgresize = imresize(img,[n m]);
    
    % compress brightness to one layer
    imgsum = sum(imgresize, 3)./(5);
    
    % rearrange to become vector
    img1D = reshape(imgsum,[1 n*m]);
%     
%     
% %     featureVector = zeros(1,(n*m) + 50);
    featureVector = img1D;
    [r,c,d] = size(img);
    % bin the colors
    if d ~= 3
        augmentedImg = repmat(imresize(img, [n2, m2]),[1,1,3]);
    else
        augmentedImg = imresize(img, [n2, m2]);
    end
    
    bins = linspace(0, 256, 15);
    binned_red = discretize(augmentedImg(:,:,1), bins);
    binned_green = discretize(augmentedImg(:,:,2), bins);
    binned_blue = discretize(augmentedImg(:,:,3), bins);
    
    scale = .0010;
    for i = 1:15
       featureVector(end+1) = sum(binned_red == i, 'all')/(r*c)*scale;
       featureVector(end+1) = sum(binned_green == i, 'all')/(r*c)*scale;
       featureVector(end+1) = sum(binned_blue == i, 'all')/(r*c)*scale;
    end
%     
%     hsv_img = rgb2hsv(augmentedImg); %hsv image
%     layer_weights = hsv_img(:,:,1)*4 + hsv_img(:,:,2)*2 + hsv_img(:,:,3)*1 + 8; % SEE PAPER
%     bins = linspace(8,15,36);
%     binned_data = discretize(layer_weights, bins);
%     for i = 1:36
%        featureVector(i) = sum(binned_data == i, 'all'); 
%     end
%     
    % add texture feature
    wavelength = 4;
    orientation = 45;
    [mag,phase] = imgaborfilt(im2gray(imgresize),wavelength,orientation);
    avg_text = sum(mag,'all')/(n*m);
    std_text = std(mag, 1, 'all');
    featureVector(end+1) = avg_text;
    featureVector(end+1) = std_text;
    
    wavelength = 8;
    orientation = 45;
    [mag,phase] = imgaborfilt(im2gray(imgresize),wavelength,orientation);
    avg_text = sum(mag,'all')/(n*m);
    std_text = std(mag, 1, 'all');
    featureVector(end+1) = avg_text;
    featureVector(end+1) = std_text;
    
    wavelength = 4;
    orientation = 90;
    [mag,phase] = imgaborfilt(im2gray(imgresize),wavelength,orientation);
    avg_text = sum(mag,'all')/(n*m);
    std_text = std(mag, 1, 'all');
    featureVector(end+1) = avg_text;
    featureVector(end+1) = std_text;
    
    wavelength = 8;
    orientation = 90;
    [mag,phase] = imgaborfilt(im2gray(imgresize),wavelength,orientation);
    avg_text = sum(mag,'all')/(n*m);
    std_text = std(mag, 1, 'all');
    featureVector(end+1) = avg_text;
    featureVector(end+1) = std_text;
    % add shape feature maybe
end