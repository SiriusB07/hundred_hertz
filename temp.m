% clear;
% clc;
% Kp_z_dot_list = [1 2 3 4 5 6];
% Kd_z_dot_list = [0.1 0.2 0.3 0.4 0.5 0.6];

% global Kp_z_dot
% global Kd_z_dot

% for i = 1:length(Kp_z_dot_list)
%     for j = 1:length(Kd_z_dot_list)
%         Kp_z_dot_list = [1 2 3 4 5 6];
%         Kd_z_dot_list = [0.1 0.2 0.3 0.4 0.5 0.6];
%         Kp_z_dot = Kp_z_dot_list(i)
%         Kd_z_dot = Kd_z_dot_list(j)
%         clear;
%         main;
%     end
% end

% 1. Define the numerator and denominator coefficients
Kp = 8e-2;
Kd = 3e-2;
num = [Kd Kp];          % Represents: 4
den = [1e-3*tau Kd+1e-3 Kp];     % Represents: s^2 + 2s + 10

% 2. Create the transfer function object
sys = tf(num, den);

% 3. Plot the step response
figure
step(sys);
grid on;            % Adds grid lines for easier reading
