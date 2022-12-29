% create three symmetric matrices A,B,C of size 10,20,30
a=[1:55]';A=diag(a(1:10))+squareform(a(10+1:end));
b=[1:210]';B=diag(b(1:20))+squareform(b(20+1:end));
c=[1:465]';C=diag(c(1:30))+squareform(c(30+1:end));

% store time counts
t = zeros(100,1);

% test matrix A
for i=1:100
    tic;
    lu_sym(A,10);
    t(i)=toc;
end
mean1=mean(t);
for i=1:100
    tic;
    lu_sym2(A,10);
    t(i) = toc;
end
mean2=mean(t);

disp(mean1/mean2);

% test matrix B
for i=1:100
    tic;
    lu_sym(B,20);
    t(i)=toc;
end
mean1=mean(t);
for i=1:100
    tic;
    lu_sym2(B,20);
    t(i) = toc;
end
mean2=mean(t);

disp(mean1/mean2);

% test matrix C
for i=1:100
    tic;
    lu_sym(C,30);
    t(i)=toc;
end
mean1=mean(t);
for i=1:100
    tic;
    lu_sym2(C,30);
    t(i) = toc;
end
mean2=mean(t);

disp(mean1/mean2);

