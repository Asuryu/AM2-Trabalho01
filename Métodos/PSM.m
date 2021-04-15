function y = PSM(f, a, b, n, y0)

% Adam Wermus
% June 5, 2015

% This program solves the ODE y'(t) = sin(t)
% The analytical solution is y(t) = -cos(t)

%clear everything
close all;
clear all;
clc;
% % Actual Solution
limite = 50;
t = 0:1:limite;
y = -cos(t);
% % Plot Actual Solution
subplot(2,1,1);
plot(t,y,'g')
title('Actual Solution');
xlabel('t');
ylabel('cos(t)');
% Declare variables for Parker-Sochacki Implementation
order = 10; % order for power series
tau = t(2) - t(1); % time step
frames = length(t); % number of iterations

% Declare a and b
a = zeros(1, order);
b = zeros(1, order);
z = zeros(1, order);

% Initial Conditions
z(1) = -1;
a(1) = 0; % a = sin(t)
b(1) = 1; % b = cos(t)
% Declare a_sum and b_sum. These are the power series sums for a and b
z_sum = zeros(1,frames);
a_sum = zeros(1,frames);
b_sum = zeros(1,frames);
% Give a_sum and b_sum initial values
z_sum(1) = -1;
a_sum(1) = 0;
b_sum(1) = 1;

% Number of frames to iterate through
for iterate = 2:frames

% Calculate Coefficients
for i = 1:order-1
z(i+1) = a(i)/(i);
a(i+1) = b(i)/(i);
b(i+1) = -a(i)/(i);
end

% Create temporary sums for a and b
z_temp_sum = 0;
a_temp_sum = 0;
b_temp_sum = 0;

% Create Maclaurin Series
for i = 1:order
z_temp_sum = z_temp_sum + z(i)*tau^(i-1);
a_temp_sum = a_temp_sum + a(i)*tau^(i-1);
b_temp_sum = b_temp_sum + b(i)*tau^(i-1);
end

% Set a_sum and b_sum to the temp sums
z_sum(iterate) = z_temp_sum;
a_sum(iterate) = a_temp_sum;
b_sum(iterate) = b_temp_sum;

% Reset Initial Conditions
z(1) = z_temp_sum;
a(1) = a_temp_sum;
b(1) = b_temp_sum;
end
% Plot Parker-Sochacki Implementation
subplot(2,1,2);
plot(t,z_sum,'g');
title('Parker-Sochacki Solution');
xlabel('t');
ylabel('Approximate Solution');

end