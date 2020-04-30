# Two-Hand-Indian-Sign-Language-Alphabets-Classification

## Overview

Currently, a lot of research is going in the field of sign language recognition. Recognition of gesture poses a serious challenge to the system due to inconsistent illuminance and background conditions, different skin colours of the hand and each person has his/her own trait of making the gesture. It gets even more difficult with Two Hand Indian Sign Language (THISL) due to the representation of gesture with both hands. There is no proper THISL dataset available to the public. So, we present a THISL dataset consisting of 26 gestures each representing the English alphabet. This dataset consists of 50x50 images of total 9100 in which each gesture is made of 350 images and it is divided into two parts, training and test. The training set consists of 7020 images and the test set consists of 2080 images. In this project, THISL dataset is validated on various classification models of machine learning(SVM,Knn,Logistic Regression, Latent Discriminant Analysis, Naive Bayes, Decision Tree)  . This dataset serves a very good purpose for benchmarking machine learning algorithms and it is freely available to people on request to authors.

[IEEE paper](https://doi.org/10.1109/ICICT46931.2019.8977713)

## Dataset Description.

The Dataset consists of 26 classes eaching representing the english alphabet. Sample image of each english alphabet is shown below.
Dataset is avaliable on request(leelasuryatejam@gmail.com)

<img src = "handcollage.png">

## Running 
To run this project, perform following steps

Dataset is available on request to (leelasuryatejam@gmail.com)

1. Run the HOG_Feature extraction.m file by setting path to train and test dataset. Ouput of this code will generate training features, test features, training labels and test lables stored in .mat file.

2. Run the classification_mat.m(knn,svm,Ada Boost,logistic regression,naive bayes,Discriminant analysis)file by importing features and labels of mat files generated from above step. Ouput of this code will generate accuracy.mat file which stores the accuracy of classifiers. 

Note: img_preprocessing.m(img-> HSV-> Skin Mask->Dilation-> gray scale) and accurate.m are the function files.

## Work Flow

<img src = "Flow chart.png">
