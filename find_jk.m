function ret = find_jk(m,n,s)
    % find all [j k]' vectors satisfying bounds
    [X,Y] = meshgrid(1:m,1:n);
    jk = cat(2,X',Y');
    jk = reshape(jk,[],2);
    jk = jk';
    % return all vectors with integer entries
    idx = all(s\jk ./round(s\jk) == [1,1]');
    ret = jk(:,idx);