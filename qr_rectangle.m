function Z = qr_rectangle(Z, m, n)
    ws = cell(m-1,1);
    for i=1:n
        fprintf("i=%d\n",i);
        x = Z(i:m,i);
        y = norm(x) * [1; zeros(m-i,1)];
        disp("x: ");
        disp(x);
        disp("y: ");
        disp(y);
        w = (x-y) / norm(x-y);
        ws{i} = w;
        disp("w:");
        disp(w)
        ip = w'*Z(i:m,i:n);
        disp("inner product:");
        disp(ip);
        disp("Zsub:");
        disp(Z(i:m,i:n));
        Z(i:m,i:n) = Z(i:m,i:n) - 2*w*ip;
        disp("Znew:");
        disp(Z);
    end
    Q = eye(m,m);
    disp("Q:")
    disp(Q)
    for i=1:m
        Qei = Q(1:m,i);
        for j=n:-1:1
            wj = ws{j};
            ip = wj'*Qei(j:m);
            Qei(j:m) = Qei(j:m) - 2*wj*ip;
        end
        Q(1:m,i) = Qei;
        disp("Q:")
        disp(Q)
    end
    
    disp("Q'Q");
    disp(Q'*Q);
    disp("QQ'");
    disp(Q*Q');
    disp("QZ");
    disp(Q*Z);

end
    