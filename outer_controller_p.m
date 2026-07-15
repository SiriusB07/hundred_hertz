err_phi = phi_d - phi;
err_theta = theta_d - theta;
err_psi = psi_d - psi;
err_z = z_d - z;

% err_phi_dot = phi_d_dot - phi_dot;
% err_theta_dot = theta_d_dot - theta_dot;
% err_psi_dot = psi_d_dot - psi_dot;
% err_z_dot = z_d_dot - z_dot;

phi_dot_d = Kp_phth * err_phi;
if(phi_dot_d > 0.25)
    phi_dot_d = 0.25;
elseif(phi_dot_d < -0.5)
    phi_dot_d = -0.25;
end
theta_dot_d = Kp_phth * err_theta;
if(theta_dot_d > 0.25)
    theta_dot_d = 0.25;
elseif(theta_dot_d < -0.25)
    theta_dot_d = -0.25;
end
psi_dot_d = Kp_psi * err_psi;
if(psi_dot_d > 0.25)
    psi_dot_d = 0.25;
elseif(psi_dot_d < -0.25)
    psi_dot_d = -0.25;
end
z_dot_d = Kp_z * err_z;
if(z_dot_d > 10)
    z_dot_d = 10;
elseif(z_dot_d < -10)
    z_dot_d = -10;
end

rates_d = [phi_dot_d; theta_dot_d; psi_dot_d; z_dot_d];