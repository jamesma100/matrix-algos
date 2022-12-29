function [Q, S] = arnoldi(A, b, n) 
    sz = size(A);
    m = sz(1,1);
    S = [];
    Q = [];
    Q(:,1) = b / norm(b);
    for i=1:n
        v = A*Q(:,end);
        S(:,end+1) = v'*Q;
        v = v - Q*S(:,end);
        S(i+1,i) = norm(v);
        Q(:,end+1) = v / S(i+1,i);
    end
end
