function lengths = loop_lengths(A,n_comp_vector)
% LOOP_LENGTHS finds the lengths of the loops in all components of A,
% assuming you already know the number of components. 

n_comp = max(n_comp_vector);

n = size(A,1);
lengths = zeros(n_comp,1);
starts = zeros(n_comp,1);

starts(1) = 1;

adj_list = adjacency_list(A);

% make a list of indexes to start looking at components from
for ii = 2:n_comp
    % find first index of component name
    temp = find((n_comp_vector - ii) == 0);
    starts(ii) = temp(1);
end

for ii = 1:n_comp
    
    index = starts(ii);
    loop_contents = [index]; % running list for component re-naming purposes. 
        
    while(1)
        
        index = adj_list(index); % jump a node
        loop_contents = [loop_contents index]; % add nodes to your path
        
        check = find(loop_contents == index);
        % if we've been here before... find length and break while. 
        if(length(check) > 1)
            diff = check(2) - check(1);
            break
        end
        
    end
    
    lengths(ii) = diff;

end

