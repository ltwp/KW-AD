function output = avg_n_components(d,p)

matrices = get_graphs(d,p);
n_matrices = length(matrices);
n_compos = zeros(n_matrices,1);

for ii = 1:n_matrices
    n_compos(ii) = max(n_comps(matrices{ii}));
end
output = mean(n_compos);

end