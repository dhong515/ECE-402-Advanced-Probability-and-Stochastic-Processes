%% Danny Hong ECE-402 PSET 5

clc;
clear;
close all;
%% Problem 1

%1a
P = [1/8 1/2 1/4 1/8; 0 1/4 1/2 1/4; 0 0 1/2 1/2; 1/2 1/2 0 0];
disp("P = ")
disp(P)

%1b
e = [1; 1; 1; 1];
Pe = P*e;
disp("Pe = ")
disp(Pe)
fprintf("Because Pe is a 4 x 1 column vector of 1s, 1 is a simple eigenvalue. \n \n")

Eigenvalues = eig(P);
disp("Eigenvalues: ")
disp(Eigenvalues.')
fprintf("The magnitudes of all the other eigenvalues are less than 1. \n \n")

[Eigenvectors, ~] = eig(P');
Eigenvectors = Eigenvectors.';
pi_vector = Eigenvectors(1, :)/sum(Eigenvectors(1, :));
disp("Pi Vector: ")
disp(pi_vector)

%1c
n = 20;
steady_state = P^n;
disp("Steady State: ")
disp(steady_state)
fprintf("It can be seen that for n large (here n = 20), every row of P^n matches with the pi row vector calculated before. \n \n") 

%1d
syms p(n) d(n)

euclidean_distance = [];
initial = [1, 0, 0, 0];
for i = 1:20
    if i == 1
        p(n) = initial*P;
        d(n) = sqrt(sum((p(n) - pi_vector).^ 2));
        euclidean_distance = [euclidean_distance, d(n)];
    else
        p(n) = p(n-1)*P;
        d(n) = sqrt(sum((p(n) - pi_vector).^ 2));
        euclidean_distance = [euclidean_distance, d(n)];
    end
end

n = 1:20;
plot(n, euclidean_distance)
title("Euclidean distance of p(n) and pi from n = 0 to n = 20")
xlabel("n")
ylabel("Euclidean distance for each value of n")

%% Problem 2

%2a
syms a
lambda = [-a, a, 0, 0; 0, -a, a, 0; 0, 0, -a, a; a, 0, 0, -a];

%2b
lambda0 = [-1, 1, 0, 0; 0, -1, 1, 0; 0, 0, -1, 1; 1, 0, 0, -1];
fprintf("The eigenvalues of lambda is just the eigenvalues of lambda0 multiplied by a factor of alpha. \n \n")

%2c
e = [1; 1; 1; 1];
lambda_e = lambda*e;
disp("Lambda * e = ")
disp(lambda_e)

fprintf("Because Lambda * e is a 4 x 1 column vector of 0s, 0 is a simple eigenvalue. \n \n")

Eigenvalues = eig(lambda);
disp("Eigenvalues: ")
disp(Eigenvalues.')

fprintf("The other eigenvalues are all located in the LHP. \n \n")

[Eigenvectors, ~] = eig(lambda');
Eigenvectors = Eigenvectors.';
pi_vector = Eigenvectors(1, :)/sum(Eigenvectors(1, :));
disp("Pi Vector: ")
disp(pi_vector)

fprintf("No, the pi vector does not depend on the alpha value. \n \n")

%2d
fprintf("Since the pi vector does not depend on the alpha value and that each row of the limiting matrix should converge to the pi vector, then the limiting matrix doesn't depend of the alpha value either. \n \n")

%2e 
s = sym('s');
B = limit((s * inv(s * eye(4) - lambda)), s, 0);
disp("Limiting Matrix from limit function: ")
disp(B)
fprintf("Here, the limiting matrix was calculated using the limit function as opposed to using the simplify function due to a divide by 0 error that occured.\n \n")

%2f
t = 100;
limiting_matrix = expm(lambda * t);
disp("Limiting Matrix from expm function: ")
disp(limiting_matrix)
fprintf("Here, the exponential terms that are in each entry are relatively small in value for large values of t, and so for large t (here t = 100), the limiting matrix converges to a 4x4 matrix consisting of only 1/4. \n")