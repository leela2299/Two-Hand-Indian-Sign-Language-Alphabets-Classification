clc;
clear all;
close all;

%----- Two Hand Indian Sign Language dataset is validated on six(6) different classifiers such as Logistic Regression,
% knn, Naive Bayes, Svm, Decision Tree, Discriminat Analysis 
% ++++++  @Leela Surya Teja Mangamuri, @Lakshay Jain 2020 +++++++++++++

%----------- Loading training and test features contained in the mat file ------------ 
a=load('testFeatures.mat');
b=load('trainingFeatures.mat');

%----------- Loading training and test labels contained in the mat file ------------ 
c=load('testLabels.mat');
d=load('trainingLabels.mat');

testFeatures=a.testFeatures;
trainingFeatures=b.trainingFeatures;
testLabels=c.testLabels;
trainingLabels=d.trainingLabels;

accuracy=[];

%--------- validating on the classifiers ----------------------
%_______________________________________________________________________________________________________________

%-------------- Logistic Regression-----------------------------------

t = templateKernel('Learner','logistic','KernelScale','auto','IterationLimit',1500); %--- logistic regression
classifier = fitcecoc(trainingFeatures,trainingLabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)]
clear classifier;
clear predictedLabels;

t = templateKernel('Learner','logistic','KernelScale','auto','IterationLimit',1000); %--- logistic regression
classifier = fitcecoc(trainingFeatures,trainingLabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)]
clear classifier;
clear predictedLabels;

t = templateKernel('Learner','logistic','KernelScale','auto','IterationLimit',2000); %--- logistic regression
classifier = fitcecoc(trainingFeatures,trainingLabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)]
clear classifier;
clear predictedLabels;

t = templateKernel('Learner','logistic','KernelScale','auto','IterationLimit',2500); %--- logistic regression
classifier = fitcecoc(trainingFeatures,trainingLabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)]
clear classifier;
clear predictedLabels;

%______________________________________________________________________________________________________________

%------------------------ knn----------------------------------------------


t= templateKNN('NumNeighbors',5,'Standardize',1,'DistanceWeight','equal','Distance','euclidean');%--knn 5,equal weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


t=  templateKNN('NumNeighbors',5,'Standardize',1,'DistanceWeight','inverse','Distance','euclidean');%--knn 5,inverse weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


 

t = templateKNN('NumNeighbors',5,'Standardize',1,'DistanceWeight','squaredinverse','Distance','euclidean');%--knn 5,squaredinverse weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];



t = templateKNN('NumNeighbors',9,'Standardize',1,'DistanceWeight','equal','Distance','euclidean');%--knn 9,inverse weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


t = templateKNN('NumNeighbors',9,'Standardize',1,'DistanceWeight','inverse','Distance','euclidean');%--knn 9,inverse weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

t = templateKNN('NumNeighbors',9,'Standardize',1,'DistanceWeight','squaredinverse','Distance','euclidean');%--knn 9,squaredinverse weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

t = templateKNN('NumNeighbors',3,'Standardize',1,'DistanceWeight','equal','Distance','euclidean');%--knn 3,inverse weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

t = templateKNN('NumNeighbors',3,'Standardize',1,'DistanceWeight','inverse','Distance','euclidean');%--knn 3,inverse weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

t = templateKNN('NumNeighbors',3,'Standardize',1,'DistanceWeight','squaredinverse','Distance','euclidean');%--knn 9,squaredinverse weight
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

%__________________________________________________________________________________________________________
%-----------------------------Naive Bayes----------------------------------

t = templateNaiveBayes('DistributionNames','kernel'); %-- naive bayes ,kernel distribution
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


t = templateNaiveBayes('DistributionNames','mn'); %-- naive bayes ,multinomial
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


t = templateNaiveBayes('DistributionNames','normal'); %-- naive bayes ,normal distribution
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

t = templateNaiveBayes('DistributionNames','mvnm'); %-- naive bayes ,multivariatae multinomial
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

%_________________________________________________________________________________________________________
%------------------------------- Support Vector Machine--------------------


t = templateSVM('KernelFunction','gaussian'); %--- svm gaussian kernel
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

t = templateSVM('KernelFunction','polynomial'); %--- svm polynomial kernel
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

%________________________________________________________________________________________________
%-----------  Decision Tree-------------------

tTree = templateTree('MinLeafSize',20); %----- decision tree classifier,ensemble method adamboost,100 tree,min leaf size 20
t = templateEnsemble('AdaBoostM1',100,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


tTree = templateTree('MinLeafSize',10); %----- decision tree classifier,ensemble method adamboost,100 tree,min leaf size 10
t = templateEnsemble('AdaBoostM1',100,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

tTree = templateTree('MinLeafSize',15); %----- decision tree classifier,ensemble method adamboost,100 tree,min leaf size 15
t = templateEnsemble('AdaBoostM1',100,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


tTree = templateTree('MinLeafSize',20); %----- decision tree classifier,ensemble method adamboost,75 trees,min leaf size 20
t = templateEnsemble('AdaBoostM1',75,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


tTree = templateTree('MinLeafSize',10); %----- decision tree classifier,ensemble method adamboost,75 tree,min leaf size 10
t = templateEnsemble('AdaBoostM1',75,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


tTree = templateTree('MinLeafSize',15); %----- decision tree classifier,ensemble method adamboost,75 tree,min leaf size 15
t = templateEnsemble('AdaBoostM1',75,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];




tTree = templateTree('MinLeafSize',20); %----- decision tree classifier,ensemble method adamboost,50 trees,min leaf size 20
t = templateEnsemble('AdaBoostM1',50,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


tTree = templateTree('MinLeafSize',10); %----- decision tree classifier,ensemble method adamboost,50 tree,min leaf size 10
t = templateEnsemble('AdaBoostM1',50,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


tTree = templateTree('MinLeafSize',15); %----- decision tree classifier,ensemble method adamboost,50 tree,min leaf size 15
t = templateEnsemble('AdaBoostM1',50,tTree,'LearnRate',0.1);
classifier = fitcecoc(trainingFeautres,traininglabels,'Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

%_____________________________________________________________________________________________
%------------  Discriminant Analysis --------------------------------------


t = templateDiscriminant('DiscrimType','pseudoLinear'); %--discriminant analysis, pseudolinear 
classifier = fitcensemble(trainingFeautres,trainingLables,'Method','Subspace','Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

t = templateDiscriminant('DiscrimType','linear'); %--discriminant analysis, linear 
classifier = fitcensemble(trainingFeautres,trainingLables,'Method','Subspace','Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];

t = templateDiscriminant('DiscrimType','diaglinear'); %--discriminant analysis, idaglinear 
classifier = fitcensemble(trainingFeautres,trainingLables,'Method','Subspace','Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


t = templateDiscriminant('DiscrimType','quadratic'); %--discriminant analysis, quardatic 
classifier = fitcensemble(trainingFeautres,trainingLables,'Method','Subspace','Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


t = templateDiscriminant('DiscrimType','diagquadratic'); %--discriminant analysis, diagquaradtic 
classifier = fitcensemble(trainingFeautres,trainingLables,'Method','Subspace','Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


t = templateDiscriminant('DiscrimType','pseudoquadratic'); %--discriminant analysis, pseudoquadratic 
classifier = fitcensemble(trainingFeautres,trainingLables,'Method','Subspace','Learners',t);
predictedLabels = predict(classifier, testFeatures);
accuracy=[accuracy;accurate(predictedLabels,testLabels)];


%------- saving the obtained result in accuracy.mat file ------------------
save('accuracy.mat','accuracy');