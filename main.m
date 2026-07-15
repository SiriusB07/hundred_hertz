clear;
clc;
init_all;

Kp_z = 2.75;
Kd_z = 0;

Kp_psi = 2;
Kd_psi = 0;

Kp_phth = 2.25;
Kd_phth = 0;

Kp_z_dot = 13;
Kd_z_dot = Kp_z_dot / 39.01;

Kp_psi_dot = 0.12;
Kd_psi_dot = Kp_psi_dot / 24.75;

Kp_phth_dot = 31.666e-3;
Kd_phth_dot = 2e-3;

t_d = 0:dt:10;
counter = 1;
n = length(t_d);

for i = 1:n-1
    
    % disp(i)
    if(i == 1)
        solver_init;
    else
        S_prev = S_curr;
        S_curr = S(end, :);
        S_d_prev = S_d;
    end
    
    input;

    values;
    
    counter = counter + 1;
    if(counter == 10)
        counter = 1;
        % outer_controller_p;
    end

    inner_controller;
    
    Wi = motor_mixer(screw);

    [t,S] = ode45(@(t,S) drone_plant(t, S, Wi), [t_d(i) t_d(i+1)], S_curr);


    log_values;
end

plot_whatever;