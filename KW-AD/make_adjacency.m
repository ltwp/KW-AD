function A = make_adjacency(adj_list)
% MAKE_ADJACENCY 

% Lukas WinklerPrins + Daniel Keliher
% 28 April 2015
% Studio Applied Math

n = length(adj_list);
A = zeros(n);

for ii = 1:length(adj_list);
    
    A(ii,adj_list(ii)) = 1;
    
end

end