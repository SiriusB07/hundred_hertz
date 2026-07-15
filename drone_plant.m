function dSdt =  drone_plant(t, S, Wi)
    global m g I A tau
    dSdt = zeros(12, 1);
    phi = S(1);
    if(phi > 0.1)
        phi = 0.1;
    elseif(phi < -0.1)
        phi = -0.1;
    end
    theta = S(2);
    if(theta > 0.1)
        theta = 0.1;
    elseif(theta < -0.1)
        theta = -0.1;
    end
    psi = S(3);
    p = S(4);
    q = S(5);
    r = S(6);
    u = S(7);
    v = S(8);
    w = S(9);
    
    Ix = I(1);
    Iy = I(5);
    Iz = I(9);

    W = S(13:16);

    W = W.* W;
    B = A * W;

    Ft = B(1);
    Tx = B(2);
    Ty = B(3);
    Tz = B(4);

    phi_dot = p + r * cos(phi) * tan(theta) + q * sin(phi) * tan(theta);
    theta_dot = q * cos(phi) - r * sin(phi);
    psi_dot = r * cos(phi) / cos(theta) + q * sin(phi) / cos(theta);
    p_dot = (Iy - Iz) * q * r / Ix + Tx / Ix;
    q_dot = (Iz - Ix) * p * r / Iy + Ty / Iy;
    r_dot = (Ix - Iy) * p * q / Iz + Tz / Iz;
    u_dot = r * v - q * w - g * sin(theta);
    v_dot = p * w - r * u + g * sin(phi) * cos(theta);
    w_dot = q * u - p * v + g * cos(theta) * cos(phi) + Ft / m;
    x_dot = w * (sin(phi) * sin(psi) + cos(phi) * cos(psi) * sin(theta)) - v * (cos(phi) * sin(psi) - cos(psi) * sin(phi) * sin(theta)) + u * (cos(psi) * cos(theta));
    y_dot = v * (cos(phi) * cos(psi) + sin(phi) * sin(psi) * sin(theta)) - w * (cos(psi) * sin(phi) - cos(phi) * sin(psi) * sin(theta)) + u * (cos(theta) * sin(psi));
    z_dot = w * (cos(phi) * cos(theta)) - u * (sin(theta)) + v * (cos(theta) * sin(phi));

    w1_dot = (Wi(1) - S(13)) / tau;
    w2_dot = (Wi(2) - S(14)) / tau;
    w3_dot = (Wi(3) - S(15)) / tau;
    w4_dot = (Wi(4) - S(16)) / tau;

    dSdt(1) = phi_dot;
    dSdt(2) = theta_dot;
    dSdt(3) = psi_dot;
    dSdt(4) = p_dot;
    dSdt(5) = q_dot;
    dSdt(6) = r_dot;
    dSdt(7) = u_dot;
    dSdt(8) = v_dot;
    dSdt(9) = w_dot;
    dSdt(10) = x_dot;
    dSdt(11) = y_dot;
    dSdt(12) = z_dot;
    dSdt(13) = w1_dot;
    dSdt(14) = w2_dot;
    dSdt(15) = w3_dot;
    dSdt(16) = w4_dot;
end