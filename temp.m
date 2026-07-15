clear;
clc;
Kp_z_dot_list = [1 2 3 4 5 6];
Kd_z_dot_list = [0.1 0.2 0.3 0.4 0.5 0.6];

global Kp_z_dot
global Kd_z_dot

for i = 1:length(Kp_z_dot_list)
    for j = 1:length(Kd_z_dot_list)
        Kp_z_dot_list = [1 2 3 4 5 6];
        Kd_z_dot_list = [0.1 0.2 0.3 0.4 0.5 0.6];
        Kp_z_dot = Kp_z_dot_list(i)
        Kd_z_dot = Kd_z_dot_list(j)
        clear;
        main;
    end
end