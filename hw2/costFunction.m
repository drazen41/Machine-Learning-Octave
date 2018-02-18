function J=costFunction(X,y,theta)
  % X -> design matrix sa treniranim primjerima
  % y -> class labels ???
  m = size(X,1); % broj treniranih
  predictions = X * theta; % predviðanja za hipotezu na m primjera
  sqrErrors = (predictions - y) .^2; % kvadrirane greške
  
  J = 1/(2*m) * sum(sqrErrors);