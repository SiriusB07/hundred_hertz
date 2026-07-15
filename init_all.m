% This is the params
global m g I A dt tau
dt = 10^-2;
tau = 75*10^-3;

m = 0.25;
g = 9.8;

I = [
    1*10^-3, 0, 0;
    0, 1*10^-3, 0;
    0, 0, 2*10^-3;
    ];

b = 6.125 * 10^-7;
d = 5*10^-9;

l1 = 0.1;
l2 = 0.1;
l3 = 0.1;
l4 = 0.1;

A = [
    -b, -b, -b, -b;
    -b*l1,0,b*l3,0;
    0, b*l2, 0, -b*l4;
    d, -d, d, -d;
    ];

% This is initialization of the drone state

phi_init = 0;
theta_init = 0;
psi_init = 0;
x_init = 0;
y_init = 0;
z_init = 0;

phi_dot_init = 0;
theta_dot_init = 0;
psi_dot_init = 0;
z_dot_init = 0;

S0 = [phi_init; theta_init; psi_init; x_init; y_init; z_init; zeros(6, 1); 1000 * ones(4, 1)];
rates0 = [phi_dot_init; theta_dot_init; psi_dot_init; z_dot_init];  

% This is initialization of the log variables
S_log=[];
S_log_discrete = [];
t_log=[];
screw_log = [];
Wi_log = [];
rates_d_log = [];
rates_log = [];

Ft_log = [];

psi_log = [];

S_d_log = [];