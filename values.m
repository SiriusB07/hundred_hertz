phi = S_curr(1);
theta = S_curr(2);
psi= S_curr(3);
z = S_curr(12);

phi_prev = S_prev(1);
theta_prev = S_prev(2);
psi_prev= S_prev(3);
z_prev = S_prev(12);

phi_dot_prev = phi_dot;
theta_dot_prev = theta_dot;
psi_dot_prev = psi_dot;
z_dot_prev = z_dot;

phi_dot = (phi - phi_prev) / dt;
theta_dot = (theta - theta_prev) / dt;
psi_dot = (psi - psi_prev) / dt;
z_dot = (z - z_prev) / dt;

phi_d_prev = S_d_prev(1);
theta_d_prev = S_d_prev(2);
psi_d_prev = S_d_prev(3);
z_d_prev = S_d_prev(4);

phi_d = S_d(1);
theta_d = S_d(2);
psi_d = S_d(3);
z_d = S_d(4);

phi_d_dot = (phi_d - phi_d_prev) / dt;
theta_d_dot = (theta_d - theta_d_prev) / dt;
psi_d_dot = (psi_d - psi_d_prev) / dt;
z_d_dot = (z_d - z_d_prev) / dt;


phi_double_dot = (phi_dot - phi_dot_prev) / dt;
theta_double_dot = (theta_dot - theta_dot_prev) / dt;
psi_double_dot = (psi_dot - psi_dot_prev) / dt;
z_double_dot = (z_dot - z_dot_prev) / dt;

phi_dot_d_prev = phi_dot_d;
theta_dot_d_prev = theta_dot_d;
psi_dot_d_prev = psi_dot_d;
z_dot_d_prev = z_dot_d;

phi_dot_d = rates_d(1);
theta_dot_d = rates_d(2);
psi_dot_d = rates_d(3);
z_dot_d = rates_d(4);

phi_dot_d_dot = (phi_dot_d - phi_dot_d_prev) / dt;
theta_dot_d_dot = (theta_dot_d - theta_dot_d_prev) / dt;
psi_dot_d_dot = (psi_dot_d - psi_dot_d_prev) / dt;
z_dot_d_dot = (z_dot_d - z_dot_d_prev) / dt;

