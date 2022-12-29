function [R,ws] = algL(A, m)
    Hs = cell(m-1, 1);
    ws = cell(m-1, 1);
    R = A;
    % calculate all H matrices
    for i = 1:m-1
       x = R(:,i);
       y = zeros(m, 1);
       y(1:i-1) = x(1:i-1);
       y(i) = norm(x(i:m));
       w = (x-y) / norm(x-y);
       ws{i} = w;
       H = eye(m) - 2*(w*w');
       Hs{i} = H;
       R = H*R;
    end
    % left multiply all H's with A
    R = A;
    for i = 1:m-1
       R = Hs{i}*R;
    end
end