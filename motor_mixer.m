function W = motor_mixer(screw)

global A

w_sq = A \ screw;

if(w_sq(1) > 4e6 || w_sq(2) > 4e6 || w_sq(3) > 4e6 || w_sq(4) > 4e6)
    % temp = max(w_sq);
    w_sq = w_sq - 1e6*ones(size(w_sq));
    temp = max(w_sq);
    w_sq = w_sq .* (3e6 / temp);
    w_sq = w_sq + 1e6*ones(size(w_sq));
end

if(w_sq(1) < 0)
    w_sq(1) = 0;
end
if(w_sq(2) < 0)
    w_sq(2) = 0;
end
if(w_sq(3) < 0)
    w_sq(3) = 0;
end
if(w_sq(4) < 0)
    w_sq(4) = 0;
end

w1 = sqrt(w_sq(1));
w2 = sqrt(w_sq(2));
w3 = sqrt(w_sq(3));
w4 = sqrt(w_sq(4));

if(w1 > 2000)
    w1 = 2000;
    disp("This should not be happening");
end
if(w2 > 2000)
    w2 = 2000;
end
if(w3 > 2000)
    w3 = 2000;
end
if(w4 > 2000)
    w4 = 2000;
end


W = [w1; w2; w3; w4];