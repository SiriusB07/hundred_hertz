plot_angular_vel = 0;
plot_states = 1;
plot_all = 0;
k = [5];

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

% Plot individually
%


% figure
% plot(t_log, rates_d_log(:,4), 'r', t_log, Sm(:,12), 'g')
% title('Z-axis Velocity')
% legend('Commanded', 'Actual')
% xlim([0 2])
% xticks(linspace(0, 2, 11))
% ymax = max(max(rates_d_log(:,4)), max(Sm(:,12)));
% ymin = min(min(rates_d_log(:,4)), min(Sm(:,12)));
% yrange = ymax - ymin;
% ymin = ymin - 0.1*yrange;
% ymax = ymax + 0.1*yrange;
% ylim([ymin ymax])
% yticks(linspace(ymin, ymax, 13))
% grid on


% plot(t_log, S_d_log(:,4), 'r', t_log, Sm(:,9), 'b')
% title('Z-axis distance')
% legend('Commanded', 'Actual')
% xlim([0 100])
% xticks(linspace(0, 100, 11))
% ymax = max(max(S_d_log(:,4)), max(Sm(:,9)));
% ymin = min(min(S_d_log(:,4)), min(Sm(:,9)));
% yrange = ymax - ymin;
% ymin = ymin - 0.1*yrange;
% ymax = ymax + 0.1*yrange;
% ylim([ymin ymax])
% yticks(linspace(ymin, ymax, 13))
% grid on

%%%%%%%% Plot here individually

% % Graph for psi
% figure
% plot(t_log, S_d_log(:,3), 'y', t_log, Sm(:,3), 'c');
% grid on
% title('Yaw Angle (psi)')
% legend('Commanded', 'Actual')
% xrange = max(t_log) - min(t_log);
% xmax = max(t_log);
% % xmax = 2;
% xmin = min(t_log);
% xlim([xmin xmax])
% xticks(linspace(xmin, xmax, 11))
% yrange = max(max(S_d_log(:,3)), max(Sm(:,3))) - min(min(S_d_log(:,3)), min(Sm(:,3)));
% ymax = max(max(S_d_log(:,3)), max(Sm(:,3))) + 0.1*yrange;
% ymin = min(min(S_d_log(:,3)), min(Sm(:,3))) - 0.1*yrange;
% ylim([ymin ymax])
% yticks(linspace(ymin, ymax, 13))

% % Graph for psi_dot
% figure
% plot(t_log, rates_d_log(:,3), 'y', t_log, Sm(:,6), 'c');
% grid on
% title('Yaw Rate (psi\_dot)')
% legend('Commanded', 'Actual')
% xrange = max(t_log) - min(t_log);
% xmax = max(t_log);
% xmax = 4;
% xmin = min(t_log);
% xlim([xmin xmax])
% xticks(linspace(xmin, xmax, 11))
% yrange = max(max(rates_d_log(:,3)), max(Sm(:,6))) - min(min(rates_d_log(:,3)), min(Sm(:,6)));
% ymax = max(max(rates_d_log(:,3)), max(Sm(:,6))) + 0.1*yrange;
% ymin = min(min(rates_d_log(:,3)), min(Sm(:,6))) - 0.1*yrange;
% ylim([ymin ymax])
% yticks(linspace(ymin, ymax, 13))


% % Graph for phi
% figure
% plot(t_log, S_d_log(:,1), 'y', t_log, Sm(:,1), 'c');
% grid on
% title('Roll Angle (phi)')
% legend('Commanded', 'Actual')
% xrange = max(t_log) - min(t_log);
% xmax = max(t_log);
% % xmax = 2;
% xmin = min(t_log);
% xlim([xmin xmax])
% xticks(linspace(xmin, xmax, 11))
% yrange = max(max(S_d_log(:,1)), max(Sm(:,1))) - min(min(S_d_log(:,1)), min(Sm(:,1)));
% ymax = max(max(S_d_log(:,1)), max(Sm(:,1))) + 0.1*yrange;
% ymin = min(min(S_d_log(:,1)), min(Sm(:,1))) - 0.1*yrange;
% ylim([ymin ymax])
% yticks(linspace(ymin, ymax, 13))

% % Graph for phi_dot
% figure
% plot(t_log, rates_d_log(:,1), 'y', t_log, Sm(:,4), 'c');
% grid on
% title('Roll Rate (phi\_dot)')
% legend('Commanded', 'Actual')
% xrange = max(t_log) - min(t_log);
% xmax = max(t_log);
% xmax = 4;
% xmin = min(t_log);
% xlim([xmin xmax])
% xticks(linspace(xmin, xmax, 11))
% yrange = max(max(rates_d_log(:,1)), max(Sm(:,4))) - min(min(rates_d_log(:,1)), min(Sm(:,4)));
% ymax = max(max(rates_d_log(:,1)), max(Sm(:,1))) + 0.1*yrange;
% ymin = min(min(rates_d_log(:,1)), min(Sm(:,1))) - 0.1*yrange;
% ylim([ymin ymax])
% yticks(linspace(ymin, ymax, 13))

% % Graph for theta
% figure
% plot(t_log, S_d_log(:,2), 'y', t_log, Sm(:,2), 'c');
% grid on
% title('Pitch Angle (theta)')
% legend('Commanded', 'Actual')
% xrange = max(t_log) - min(t_log);
% xmax = max(t_log);
% % xmax = 2;
% xmin = min(t_log);
% xlim([xmin xmax])
% xticks(linspace(xmin, xmax, 11))
% yrange = max(max(S_d_log(:,2)), max(Sm(:,2))) - min(min(S_d_log(:,2)), min(Sm(:,2)));
% ymax = max(max(S_d_log(:,2)), max(Sm(:,2))) + 0.1*yrange;
% ymin = min(min(S_d_log(:,2)), min(Sm(:,2))) - 0.1*yrange;
% ylim([ymin ymax])
% yticks(linspace(ymin, ymax, 13))

% % Graph for theta_dot
% figure
% plot(t_log, rates_d_log(:,2), 'y', t_log, Sm(:,5), 'c');
% grid on
% title('Pitch Rate (theta\_dot)')
% legend('Commanded', 'Actual')
% xrange = max(t_log) - min(t_log);
% xmax = max(t_log);
% xmax = 4;
% xmin = min(t_log);
% xlim([xmin xmax])
% xticks(linspace(xmin, xmax, 11))
% yrange = max(max(rates_d_log(:,2)), max(Sm(:,5))) - min(min(rates_d_log(:,2)), min(Sm(:,5)));
% ymax = max(max(rates_d_log(:,2)), max(Sm(:,5))) + 0.1*yrange;
% ymin = min(min(rates_d_log(:,2)), min(Sm(:,5))) - 0.1*yrange;
% ylim([ymin ymax])
% yticks(linspace(ymin, ymax, 13))
%

% Plot_all
%
if(plot_all == 1)

    figure
    for i = 1:12
        subplot(4,3,i)
        plot(t_log, Sm(:,i))
        title(sprintf('Variable %d', i))
        title(label(:, i));
        if(i <= 3)
            ylim([-0.5 0.5])
            yticks(-0.5:0.1:0.5)
        elseif(i <= 6)
            ylim([-5 5])
            yticks(-5:1:5)
        elseif(i <= 9)
            ylim([-1 1])
            yticks(linspace(-1, 1, 11))
        elseif(i <= 12)
            ylim([-10 10])
            yticks(-10:2:10)
        end
        xticks(0:1:10)
        grid on
    end
end
%

% plot_states
%
if(plot_states == 1)
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

    for i = k
            figure
            plot(t_log, Sm(:,i), "LineWidth", 1.5, "Color", 'c')
            title(label(:, i));

            yrange = max(Sm(:,i)) - min(Sm(:,i));
            ymin = min(Sm(:,i)) - 0.1*yrange;
            ymax = max(Sm(:,i)) + 0.1*yrange;
            ylim([ymin ymax]);
            yticks(linspace(ymin, ymax, 13));

            % xrange = max(t_log) - min(t_log);
            l = 0;
            l = 1;
            k = max(t_log);
            k = 3;
            xlim([l k]);
            xticks(linspace(l, k, 11));
            grid on

            plot_idx = t_log >= l & t_log <= k;
            t_plot = t_log(plot_idx);
            y_plot = Sm(plot_idx, i);

            if ~isempty(t_plot)
                y_initial = y_plot(1);
                y_final = y_plot(end);
                y_delta = y_final - y_initial;

                if abs(y_delta) > eps
                    y_progress = (y_plot - y_initial) / y_delta;
                    t_10_idx = find(y_progress >= 0.1, 1, 'first');
                    t_90_idx = find(y_progress >= 0.9, 1, 'first');

                    if isempty(t_10_idx) || isempty(t_90_idx)
                        rise_time = NaN;
                    else
                        rise_time = t_plot(t_90_idx) - t_plot(t_10_idx);
                    end

                    if y_delta > 0
                        peak_value = max(y_plot);
                        overshoot = max(0, (peak_value - y_final) / abs(y_delta) * 100);
                    else
                        peak_value = min(y_plot);
                        overshoot = max(0, (y_final - peak_value) / abs(y_delta) * 100);
                    end
                else
                    rise_time = NaN;
                    overshoot = 0;
                end

                % fprintf('\n%s\n', label(i));
                % fprintf('Rise time: %.4f s\n', rise_time);
                % fprintf('Overshoot: %.2f %%\n', overshoot);

                metric_text = sprintf('Rise time: %.4f s\nOvershoot: %.2f %%', rise_time, overshoot);
                text(0.8425, 0.98, metric_text, ...
                    'Units', 'normalized', ...
                    'VerticalAlignment', 'top', ...
                    'BackgroundColor', 'black', ...
                    'EdgeColor', 'white');
            end
    end
end
%

% plot_drone
%
% x_log = S_log_discrete(:, 10);
% y_log = S_log_discrete(:,11);
% z_log = S_log_discrete(:,12);
% phi_log = S_log_discrete(:,1);
% theta_log = S_log_discrete(:,2);
% psi_log = S_log_discrete(:,3);


% % phi = 0.1;
% % theta = 0;
% % psi = 0;

% % x = 1;
% % y = 1;
% % z = -1;

% % for i=1:n-1
% %     disp(i)
% %     disp(z_log(i))
% % end

% isplot = 1;
% r1 = 25 * 10^-4;
% if(isplot == 1)
%     t1 = linspace(0, 2*pi, 50);
%     P = [r1 * cos(t1); r1 * sin(t1); zeros(size(t1))];
% end

% figure

% for i=1:200
%     A1 = [l1 0 0];
%     A2 = [0 l2 0];
%     A3 = [-l3 0 0];
%     A4 = [0 -l4 0];
%     C = [0 0 0];

%     l1 = 0.015;
%     l2 = 0.015;
%     l3 = 0.015;
%     l4 = 0.015;


%     % disp(i)
%     clf
%     x = x_log(i);
%     y = y_log(i);
%     z = z_log(i);
%     % disp([x y z])
%     theta = theta_log(i);
%     phi = phi_log(i);
%     psi = psi_log(i);

%     % if(i < 100)
%     %     phi = 0;
%     % elseif(i >= 100 && i <= 200)
%     %     phi = pi / 3;
%     % end

%     % theta = 0;
%     % phi = 0;
%     % psi = 0;

%     R = [cos(theta)*cos(psi), sin(phi)*sin(theta)*cos(psi) - cos(phi)*sin(psi), cos(phi)*sin(theta)*cos(phi) + sin(phi)*sin(psi);
%     cos(theta)*sin(psi), sin(phi)*sin(theta)*sin(psi) + cos(phi)*cos(psi), cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi);
%     -sin(theta), sin(phi)*cos(theta), cos(phi)*cos(theta)];

    

%     C = C + [x y z];
%     A1 = (R * (A1)')';
%     A2 = (R * (A2)')';
%     A3 = (R * (A3)')'; 
%     A4 = (R * (A4)')';

%     % if(i == 200)
%     %     disp(R)
%     %     disp(A2)
%     % end
    
%     P2 = R * P;

%     % plot3
    
%     % plot3(P(:,1))

%     if(isplot == 1)
%         hold on
%         % plot3([-l3 l1], [0 0], [0 0], 'c', 'LineWidth', 2)
%         % plot3([0 0], [-l3 l1], [0 0], 'c', 'LineWidth', 2)
%         plot3([A1(1)+C(1) A3(1)+C(1)], [A1(2)+C(2) A3(2)+C(2)], [A1(3)+C(3) A3(3)+C(3)], 'c', 'LineWidth', 2)
%         plot3([A2(1)+C(1) A4(1)+C(1)], [A2(2)+C(2) A4(2)+C(2)], [A2(3)+C(3) A4(3)+C(3)], 'c', 'LineWidth', 2)
%         plot3(C(1), C(2), C(3), 'o', 'Color', '#ff922b', 'MarkerSize', 20, 'MarkerFaceColor', '#ff922b')

%         plot3(A1(1)+C(1), A1(2)+C(2), A1(3)+C(3), 'o', 'Color', '#0ca678', 'MarkerSize', 8, 'MarkerFaceColor', '#0ca678')
%         plot3(A2(1)+C(1), A2(2)+C(2), A2(3)+C(3), 'o', 'Color', '#0ca678', 'MarkerSize', 8, 'MarkerFaceColor', '#0ca678')
%         plot3(A3(1)+C(1), A3(2)+C(2), A3(3)+C(3), 'o', 'Color', '#0ca678', 'MarkerSize', 8, 'MarkerFaceColor', '#0ca678')
%         plot3(A4(1)+C(1), A4(2)+C(2), A4(3)+C(3), 'o', 'Color', '#0ca678', 'MarkerSize', 8, 'MarkerFaceColor', '#0ca678')

%         plot3((A1(1)+C(1))*(ones(size(t1))) + P2(1, :), (A1(2)+C(2))*(ones(size(t1)) + P2(2, :)), (A1(3)+C(3))*ones(size(t1)) + P2(3, :), 'Color', '#0ca678', 'LineWidth', 1)
%         plot3((A2(1)+C(1))*(ones(size(t1))) + P2(1, :), (A2(2)+C(2))*(ones(size(t1)) + P2(2, :)), (A2(3)+C(3))*ones(size(t1)) + P2(3, :), 'Color', '#0ca678', 'LineWidth', 1)
%         plot3((A3(1)+C(1))*(ones(size(t1))) + P2(1, :), (A3(2)+C(2))*(ones(size(t1)) + P2(2, :)), (A3(3)+C(3))*ones(size(t1)) + P2(3, :), 'Color', '#0ca678', 'LineWidth', 1)
%         plot3((A4(1)+C(1))*(ones(size(t1))) + P2(1, :), (A4(2)+C(2))*(ones(size(t1)) + P2(2, :)), (A4(3)+C(3))*ones(size(t1)) + P2(3, :), 'Color', '#0ca678', 'LineWidth', 1)


%         % plot3(A1(1)+C(1), A1(2)+C(2), A1(3)+C(3), 'o', 'Color', '#0ca678', 'MarkerSize', 8, 'MarkerFaceColor', '#0ca678')
%         view(45,30)      % azimuth = 45°, elevation = 30°
%         plot3(x, y, z)

%         yrange = .035;
%         ymax = C(2) + 0.55 * yrange;
%         ymin = C(2) - 0.55 * yrange;

%         xrange = .035;
%         xmax = C(1) + 0.55 * xrange;
%         xmin = C(1) - 0.55 * xrange;

%         xlim([xmin xmax])     
%         ylim([ymin ymax])
%         zlim([-2 1])
%         hold off
%         grid on
%         k = 2.5;
%         title(sprintf('Trajectory for t = %.2f', (i*dt)))
%         xlabel('X-axis (m)')
%         ylabel('Y-axis (m)')
%         zlabel('Z-axis (m)')  
%     end
%     pause(0.0001)
% end
%

% plot angular Velocities
%
if(plot_angular_vel == 1)
    figure
    for i = 1:4
        subplot(2,2,i)
        plot(t_log, S_log(:,i+12), 'b-', t_log, Wi_log(:,i), 'r-');
        grid on
        xticks(0:1:10)
        yrange = 2000;
        ymin = 0 - 0.1*yrange;
        ymax = 2000 + 0.1*yrange;
        ylim([ymin ymax])
        yticks(linspace(ymin, ymax, 13))

        k1 = 0;
        k2 = 2;
        xlim([k1 k2]);
        xticks(linspace(k1, k2, 11));
        grid on
        xlabel('Time (s)')
        ylabel('Angular Velocity (rad/s)')
        title(sprintf('Motor %d Angular Velocity', i))
        legend('Actual', 'Commanded')
    end
end
%