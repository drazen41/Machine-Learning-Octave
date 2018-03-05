function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
y_t = zeros(m,num_labels);
for i=1:m
  b = 0;
  if y(i)==10
    b=10;
  else
    b = rem(y(i),10);
  end
  
  y_t(i,b) = 1;
end
%size_y_t = size(y_t)
% oko = eye(num_labels);
% prvi_y = y(1); % 10
% y_mat = oko(prvi,:) % 0   0   0   0   0   0   0   0   0   1
% y_matrix = eye(num_labels)(y,:) % vektorizirano
a1 = [ones(m,1) X];
z2 = a1 * Theta1';
a2 = sigmoid(z2);
a2 = [ ones(size(a2,1),1) a2];
%size(a2)
z3 = a2 * Theta2';
a3 = sigmoid(z3);
%size_a3 = size(a3)

t = sum(sum((-y_t .* log(a3))-((1-y_t) .* log(1-a3))));
%size(t)
J = t/m;
reg = (lambda/(2*m)) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));
%size_reg = size(reg)
J += reg;


error3 = a3 - y_t;
%size_delta3 = size(delta3)
error2 = error3 * Theta2(:,2:end) .* sigmoidGradient(z2) ;
%size(error2)
Delta1 = error2' * a1;
%size(Delta1)
Delta2 = error3' * a2;

Theta1_grad = Delta1 / m;
Theta2_grad = Delta2 / m;
%size(Theta1_grad)

Theta1_reg = Theta1;
Theta1_reg(:,1)=0;
Theta2_reg = Theta2;
Theta2_reg(:,1)=0;
Theta1_reg = (Theta1_reg * lambda) / m;
%size(Theta1_reg);
Theta1_grad += Theta1_reg;
Theta2_reg = (Theta2_reg * lambda)/m;
Theta2_grad += Theta2_reg;


















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
