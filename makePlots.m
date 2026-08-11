clf
clear all
clc
load("filename.mat")

plot_all = 1;

phi = S_log(:,1);
theta = S_log(:,2);
psi = S_log(:,3);
p = S_log(:,4);
q = S_log(:,5);
r = S_log(:,6);
u = S_log(:,7);
v = S_log(:,8);
w = S_log(:,9);
x = S_log(:,10);
y = S_log(:,11);
z = S_log(:,12);

phi_dot = p + r .* cos(phi) .* tan(theta) + q .* sin(phi) .* tan(theta);
theta_dot = q .* cos(phi) - r .* sin(phi);
psi_dot = r .* cos(phi) ./ cos(theta) + q .* sin(phi) ./ cos(theta);
x_dot = w .* (sin(phi) .* sin(psi) + cos(phi) .* cos(psi) .* sin(theta)) - v .* (cos(phi) .* sin(psi) - cos(psi) .* sin(phi) .* sin(theta)) + u .* (cos(psi) .* cos(theta));
y_dot = v .* (cos(phi) .* cos(psi) + sin(phi) .* sin(psi) .* sin(theta)) - w .* (cos(psi) .* sin(phi) - cos(phi) .* sin(psi) .* sin(theta)) + u .* (cos(theta) .* sin(psi));
z_dot = w .* (cos(phi) .* cos(theta)) - u .* (sin(theta)) + v .* (cos(theta) .* sin(phi));

Sm = [phi, theta, psi, phi_dot, theta_dot, psi_dot, x, y, z, x_dot, y_dot, z_dot, S_log(:,13), S_log(:,14), S_log(:,15), S_log(:,16)];
label = ["phi", "theta", "psi", "phi\_dot", "theta\_dot", "psi\_dot", "x", "y", "z", "x\_dot", "y\_dot", "z\_dot", "w1", "w2", "w3", "w4"];


plot(t_log, z, 'LineWidth', 1.5);
grid on