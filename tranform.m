function tranform(file, a, x, y , theta)

b = im2double(imread(file)); 

if a == 1
    [row,  col] = size(b);
    N = [x 0 0; 
         0 y 0; 
         0 0 1];
      
    img = ones(row, col);
    for i = 1:row
        for j = 1:col
            new1 = [i j 1]* N;
            img(new1(1), new1(2)) = b(i, j);
        end
    end

elseif a == 2
    [row, col] = size(b);
    N = [cosd(theta)  sind(theta) 0; 
         -sind(theta) cosd(theta) 0; 
         0            0           1];
     
    img = zeros(row, col);
    for i = 1:row
        for j = 1:col
            new1 = [i j 1] * N;
            img(abs(new1(1)), abs(new1(2))) = b(i, j);
        end
    end

elseif a == 3
    [row, col] = size(b);
    N = [1 0 0; 
         0 1 0; 
         x y 1];
    img = ones(row, col);
    for i = 1:row
        for j = 1:col
            new1 = [i j 1] * N;
            img(new1(1), new1(2)) = b(i, j);
        end
    end
end
  
    
figure
subplot(1, 2, 1);
imshow(b);
title('Original Image'),
subplot(1, 2, 2);
imshow(img);
title('linear mapping method Affine Transformation')

end

