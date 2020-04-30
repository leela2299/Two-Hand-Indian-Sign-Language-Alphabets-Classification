function [img] = img_preprocessing(I)


%______ Preprocessing of the image before the feature extraction
%---- @Lakshay Jain, @Leela Surya Teja ---> 2020, Sign Language to Regional
%Language Converter funded by Dept of Science & Tech, Govt of India



%---------------  reading the image   -------------------------------------------


I=double(I);


% ------------------------  converting image from RGB to HSV -------

[hue,s,v]=rgb2hsv(I);
%figure,imshow(rgb2hsv(I));

%---- Hand segmentation by setting the thershold value for skin colour ----

cb =  0.148* I(:,:,1) - 0.291* I(:,:,2) + 0.439 * I(:,:,3) + 128;
cr =  0.439 * I(:,:,1) - 0.368 * I(:,:,2) -0.071 * I(:,:,3) + 128;
[w h]=size(I(:,:,1));
for i=1:w
    for j=1:h            
        if  80<=cr(i,j) && cr(i,j)<=165 && 140<=cb(i,j) && cb(i,j)<=195 && 0.01<=hue(i,j) && hue(i,j)<=0.5     
            segment(i,j)=1;            
        else       
            segment(i,j)=0;    
        end    
    end
end

im(:,:,1)=I(:,:,1).*segment;   
im(:,:,2)=I(:,:,2).*segment; 
im(:,:,3)=I(:,:,3).*segment;

%------- Dilating the image ----------------------
se = strel('square',2);
img=imdilate(im,se);
imshow(uint8(img));
%----- converting dilated image to gray scale --------- 

img=(rgb2gray(uint8(img)));

%figure,imshow(uint8(img));



end

