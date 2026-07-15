phi_dot_d = rates_d(1);
theta_dot_d = rates_d(2);
psi_dot_d = rates_d(3);
z_dot_d = rates_d(4);

err_phi_dot = phi_dot_d - phi_dot;
err_theta_dot = theta_dot_d - theta_dot;
err_psi_dot = psi_dot_d - psi_dot;
err_z_dot = z_dot_d - z_dot;

err_phi_double_dot = phi_dot_d_dot - phi_double_dot;
err_theta_double_dot = theta_dot_d_dot - theta_double_dot;
err_psi_double_dot = psi_dot_d_dot - psi_double_dot;
err_z_double_dot = z_dot_d_dot - z_double_dot;

Ft = Kp_z_dot * err_z_dot + Kd_z_dot * err_z_double_dot;
Tx = Kp_phth_dot * err_phi_dot + Kd_phth_dot * err_phi_double_dot;
Ty = Kp_phth_dot * err_theta_dot + Kd_phth_dot * err_theta_double_dot;
Tz = Kp_psi_dot * err_psi_dot + Kd_psi_dot * err_psi_double_dot;

screw = [-(m*g-Ft); Tx; Ty; Tz];

% screw = [(-m*g+Ft); 0; Ty; 0];