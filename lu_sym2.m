function [L,A] = lu_sym2(A,m)
    L = eye(m);
    for j=1:m-1
        v = [zeros(j,1);A(j,j+1:m)'/A(j,j)];
        e = zeros(m,1); e(j) = 1;           %e(j)
        x = e'*A;
        L(j+1:m,j) = v(j+1:m);
        M = zeros(m,m);                     % rank1 matrix
        % create half of a rank 1 matrix
        for i=j+1:m
            for k=i:m
                M(i,k) = v(i)*x(k);
            end
        end
        % update A
        A = A - M;
    end
    % set all entries below diagonal to 0
    for j=1:m-1
        for i=j+1:m
            A(i,j) = 0;
        end
    end
end