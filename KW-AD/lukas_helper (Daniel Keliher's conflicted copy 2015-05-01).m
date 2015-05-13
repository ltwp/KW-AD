% Lukas' little helper program.

% First thing: for a small set of quadratics, look for isomorphic graphs!
% We have three dimensions: d,p,and index of polynomial.

d = 4;
p = 5;

matrices = get_graphs(d,p);

n_poly = length(matrices);
isomorphic = zeros(n_poly);

for ii = 1:n_poly
    
    progress_bar(ii,1,n_poly);
    
    for jj = ii:n_poly
        %fprintf('trying %d and %d\n',ii,jj);
        
        % if you want to test for exactness, add third argument "1"
        if(graphs_isomorphic(matrices{ii},matrices{jj}))
            isomorphic(ii,jj) = 1;
        end
    end
end

isomorphic = isomorphic + triu(isomorphic,1)';

% Let's compute the avg component numbers for cubics. 
% d = 3;
% 
% primey = primes(31);
% n_comps = zeros(size(primey));
% 
% for ip = 1:length(primey)
%     
%     progress_bar(ip,1,length(primey));
%     
%     n_comps(ip) = avg_n_components(d,primey(ip));
%     
% end
