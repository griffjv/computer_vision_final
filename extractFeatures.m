function featureVector = extractFeatures(img, n, m)
    imgresize = imresize(img,[n m]);
    imgsum = zeros(n,m);
    for i = 1 : n
        for j = 1 : m
            imgsum(i,j) = imgresize(i,j,1) + imgresize(i,j,2) + imgresize(i,j,3);
        end
    end
    img1D = reshape(imgsum,[1 n*m]);
    featureVector = zeros(1,(n*m) + 50);
    featureVector(1:n*m) = img1D;
    %featureVector = img;
end