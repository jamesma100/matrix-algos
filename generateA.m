function A = generateA(T, m, k)
    A = zeros(m, k+1);
    for i=1:m
        for j=1:k+1
            A(i,j) = T(i)^(j-1);
        end
    end
end