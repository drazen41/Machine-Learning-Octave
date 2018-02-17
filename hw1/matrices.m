A = [1 2104; 1 1416; 1 1534; 1 852]; % velièina kuæa
h = [-40;0.25]; % h(x)=-40 + 0.25 x
prices = A * h; % predviðene cijene

% 3 hipoteze
% h1 = -40 + 0.25x
% h2 = 200 + 0.1x
% h3 = -150 + 0.4x

h1 = [-40 200 -150; 0.25 0.1 0.4];
prices = A * h1; % cijene za svaku hipotezu po kolonama

a = [1;3;2];
e = eye(3);
e*a;

% inverse
a = [3 4;2 16];
e = eye(2);
b = e / a;
pinv(a);

% transpose
% Aij = Bji
B = a'
