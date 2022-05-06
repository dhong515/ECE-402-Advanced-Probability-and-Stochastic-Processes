%% ECE 402 PSET 5 Problem 3d

clc;
clear;
close all;

P = [0 1/2 0 1/2; 1/2 0 1/2 0; 0 1/2 0 1/2; 1/2 0 1/2 0];

%Choose m = 1 and N = 2
m = 1;
N = 2;

disp("P^(1+2) = ")
disp(P^(N+m))
disp("P^1 = ")
disp(P^m)

fprintf("Therefore, m = 1 and N = 2. \n \n")

Q = (1/2)*(P + (P^2));
disp("Q = ")
disp(Q)

fprintf("No, the time-average occupancy distribution does not depend on the initial vector p(0). \n \n") 

steady_state = P*Q;
disp("The UNIVERSAL steady state time-average distribution: ")
disp(steady_state);