function [R, ws] = algG(A, m)
    R = A;
    ws = cell(m-1, 1);
    for i = 1:m-1
        x = R(i:m, i);
        y = norm(x) * [1; zeros(m-i, 1)];
        w = (x-y) / norm(x-y);
        ws{i} = w;
        % calculate inner product first
        iprod = w'*R(i:m,i:m);
        R(i:m,i:m) = R(i:m,i:m) - 2*w*iprod;  
    end
end