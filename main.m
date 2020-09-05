%question no.1
img=imread('leena_noisy.jpg');
img=cast(img(:,:,1),'double');
imshow('leena_noisy.jpg')
title('original image')
for sze=3:4:11
    for sigma=5:15:30
        figure();
        imshow(mat2gray(convolution_2d(img,gaussianker(sze,sigma),0)));
        title(['denoised image with standard deviation' num2str(sigma) 'of size' num2str(sze) 'x' num2str(sze) ])
    end
end
for sze=3:4:11
    figure();
    imshow(mat2gray(convolution_2d(img,mean_filter(sze),0)))
    title(['denoised image with mean filter of size' num2str(sze) 'x' num2str(sze) ])
end

    
%%
%question no.3

sobx=[1,2,1;0,1,0;-1,-2,-1]';
soby=[1,2,1;0,1,0;-1,-2,-1];
img1=cast(imread('image1.jpg'),'double');
Gx=convolution_2d(img1,sobx,0);
Gy=convolution_2d(img1,soby,0);
imshow('image1.jpg')
title('original image')
figure()
imshow(Gx)
title('gradient matrix showing edges in horizontal edges')
figure();
imshow(Gy)
title('gradient matrix showing edges in vertical edges')
abs_mag=abs(Gx)+abs(Gy);
figure();
imshow(abs_mag/255)
title('gradient matrix showing edges')



%%
%question no.2

img2=imread('where-is-waldo.jpg');
img2=cast(img2(:,:,1),'double');
img3=imread('waldo.jpg');
img3=cast(img3(:,:,1),'double');

result=correlation(img2,img3,1);
maximum=max(max(result));
[a,b]=find(result == maximum);
imshow(mat2gray(result))
title('correlation map showing a dot where the correlation is maximum')

figure();
imshow('where-is-waldo.jpg')
hold on;
rectangle('Position',[b-33,a-45,67,91],...
          'Curvature',[0,0],...
         'LineWidth',2,'LineStyle','-')
title('the position of the image patch with the highest correlation')
     

