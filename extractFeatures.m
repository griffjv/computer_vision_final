function featureVector = extractFeatures(img, n, m)
    imgresize = imresize(img,[n m]);
    
    % compress brightness to one layer
    imgsum = sum(imgresize, 3);
    
    % rearrange to become vector
    img1D = reshape(imgsum,[1 n*m]);
    
    
%     featureVector = zeros(1,(n*m) + 50);
    featureVector = img1D;
end