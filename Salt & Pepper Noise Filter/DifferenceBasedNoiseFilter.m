clear; clc;
%Add original image without noise
J = imread('1269456.jpg');
%Add noise to image
if numel(size(J))>=3
    J = rgb2gray(J);
end
I = imnoise(J,'salt & pepper');
%Show Original Image
figure;
imshow(J,[]);
[r,c]=size(J);
Filtered_Image=J;
std = std2(I);
% Nested loops to check for varying pixels and adjust them
for i=2:r-1
    for j=2:c-1
        if (I(i,j) - I(i-1,j+1)) > std && (I(i,j) - I(i+1,j-1)) > std && (I(i,j) - I(i-1,j-1)) > std  && (I(i,j) - I(i+1,j+1)) > std
           Filtered_Image(i,j) = I(i+1,j+1); 
        end
        
      
     
    end
end

%Show Noisy Image
figure;
imshow(I,[]);
Filtered_Image = uint8(Filtered_Image);
figure;
%Show FIltered image
imshow(Filtered_Image,[]);
%Test accuarcy using SSIM
[ssimval,ssimmap] = ssim(J,Filtered_Image);
disp(ssimval);
