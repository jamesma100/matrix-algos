function [A,b,x] = findPolynomial(f, a, b, m, k)
    T = linspace(a,b,m)';
    b = f(T);
    A = [ones(m, 1)];
    for i=1:k
        A = [A T.^i];
    end
    % solve least squares by QR factoring
    [Q,R] = qr(A);
    Q1 = Q(:,1:k+1);
    % solve Q1'Ax = Q1'b
    x = inv(Q1'*A)*Q1'*b;
    
    plot(T, A*x, T, b);
    disp("error:");disp(norm(b-A*x));
end