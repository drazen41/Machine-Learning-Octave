function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
  greska = sum(yval);
  val = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
  for i=1:length(val)
    %val(i)
    %C=i;
    a=val(i);
    for j=1:length(val)
      %sigma = j;
      b=val(j);
      model= svmTrain(X, y, a, @(x1, x2) gaussianKernel(x1, x2, b));
      pred = svmPredict(model,Xval);
      %size_pred = size(pred);
      c = sum(xor(pred,yval));
      %d = mean(double(pred ~= yval)) % iz ex6.pdf
      if c<greska 
        greska = c;
        C = a;
        sigma = b;
      end
     
      
      %size_greska = size(greska)
    end
    
  end
  
 
  
%model= svmTrain(X, y, 0.01, @(x1, x2) gaussianKernel(x1, x2, 0.01));
%pred = svmPredict(model,Xval);
%yval
%test = pred & yval



% =========================================================================

end
