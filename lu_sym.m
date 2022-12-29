function [L,A] = lu_sym(A,m)
    L = eye(m);
    for j=1:m-1
        v = [zeros(j,1);A(j+1:m,j)/A(j,j)];
        e = zeros(m,1);
        e(j) = 1;
        L(j+1:m,j) = v(j+1:m);
        A = A - v*e'*A;
    end
end