%______ Train and Test images feature extraction
%---- @Lakshay Jain, @Leela Surya Teja ---> 2020, Sign Language to Regional
%Language Converter funded by Dept of Science & Tech, Govt of India



clc;
clear all;
close all;

% Load training and test data using |imageDatastore|.
syntheticDir   = fullfile('C:\Users\LEELA SURYA TEJA\Desktop\train');
handwrittenDir = fullfile('C:\Users\LEELA SURYA TEJA\Desktop\abhitest');

accuaracy=[];

% |imageDatastore| recursively scans the directory tree containing the
% images. Folder names are automatically used as labels for each image.
trainingSet = imageDatastore(syntheticDir,   'IncludeSubfolders', true, 'LabelSource', 'foldernames');
testSet     = imageDatastore(handwrittenDir, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');


% consider the sample image
img = readimage(trainingSet, 206);
img=img_preprocessing(img);

% Extract HOG features and HOG visualization

[hog_4x4, vis4x4] = extractHOGFeatures(img,'CellSize',[4 4]);

cellSize = [4 4];
hogFeatureSize = length(hog_4x4);

% Loop over the trainingSet and extract HOG features from each image. A
% similar procedure will be used to extract features from the testSet.

numImages = numel(trainingSet.Files);
numImages1 = numel(testSet.Files);


testFeatures = zeros(numImages1, hogFeatureSize, 'single');
trainingFeatures = zeros(numImages, hogFeatureSize, 'single');

%------- Loop for the training images--------------------------------

for i = 1:numImages
    img = readimage(trainingSet, i);
    
    %--------- preprocess the each image------------
    img=img_preprocessing(img);
    
    %------ Extract HOG Features------------
  
    trainingFeatures(i, :) = extractHOGFeatures(img, 'CellSize', cellSize);
    
end

%------- Loop for the testing images--------------------------------

for i = 1:numImages1
    img = readimage(testSet, i);
    
    %--------- preprocess the each image------------
    img=img_preprocessing(img);
    
    %------ Extract HOG Features------------
   testFeatures(i, :) = extractHOGFeatures(img, 'CellSize', cellSize);  
end

% Get labels for each image.
trainingLabels = trainingSet.Labels;
testLabels = testSet.Labels;

%---------- save the features and labels in mat file--------------------
save('testFeatures.mat','testFeatures');
save('trainingFeatures.mat','trainingFeatures');
save('testLabels.mat','testLabels');
save('trainingLabels.mat','trainingLabels');
