S_log = [S_log; S]; %Storing the transient values of all the drone states.
S_log_discrete = [S_log_discrete; S(end, :)]; %Storing the discrete values of all the drone states.
rates_d_log = [rates_d_log; rates_d' .* ones(length(t), 1)];
rates_log = [rates_log; [phi_dot, theta_dot, psi_dot, z_dot] .* ones(length(t), 1)];
screw_log = [screw_log; screw' .* ones(length(t), 1)];
t_log = [t_log; t];
Wi_log = [Wi_log; Wi' .* ones(length(t), 1)];

psi_log = [psi_log; psi .* ones(length(t), 1)];

S_d_log = [S_d_log; S_d' .* ones(length(t), 1)];