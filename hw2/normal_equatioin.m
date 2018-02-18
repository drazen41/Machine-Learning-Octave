clear
clc
velicina = [2104;1416;1534;852];
bedrooms = [5;3;3;2];
floors = [1;2;2;1];
ages = [45;40;30;36];
cijene = [460;232;315;178]
X(1:length(velicina),1)=1;
X = [X velicina bedrooms floors ages]
theta = pinv(X'*X)*X'*cijene

