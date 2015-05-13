function output = graphs_isomorphic(A,B)
% GRAPHS_ISOMORPHIC takes in two adjacency matrices, A and B, and outputs
% either a 1 or 0 depending on whether they represent isomorphic directed
% graphs or not, respectively. After a few simple checks, brute force. 

% This is a computationally complex question and we're not trying to be
% super efficient here. 

% Assume non-isomorphic...
output = 0;

if(sum(size(A)==size(B)) == 2)
    
    n = size(A,1);
    p = n;
    
    % Quick identical check:
    if(sum(sum(A==B)) == n^2)
        %fprintf('These graphs are identically similar!\n');
        output =  1;
        return
    end
    
    %output = 0;
    %return

    n_componentsA_vector = n_comps(A);
    n_componentsB_vector = n_comps(B);
    
    n_componentsA = max(n_componentsA_vector);
    n_componentsB = max(n_componentsB_vector);

    if(n_componentsA == n_componentsB)
        % we're cruising so far
        n_components = n_componentsA;
        
        loop_lengthsA = sort(loop_lengths(A,n_componentsA_vector));
        loop_lengthsB = sort(loop_lengths(B,n_componentsB_vector));
        
        if(sum(loop_lengthsA == loop_lengthsB) == n_components)
            % OK, we gotta brute force this bitch. 
            
            % Take one as the "fixed" to compare to. (A)
            % We'll try all permutations of B p^p
            
            adj_listA = adjacency_list(A);
            adj_listB = adjacency_list(B);
            adj_list_full = [(1:p)' adj_listB];
            % for ordered swapping purposes
            
            nums = 1:p; % none of this zero business
            swaps = perms(nums);
            
            for ii = 1:length(swaps) % this is the big loop. 
                
                %progress_bar(ii,1,length(swaps));
                
                swapsi = swaps(ii,:);
                compare_list = zeros(n,2);
                
                for jj = 1:n
                    % We're gonna relabel the nodes of B's adjacency list,
                    % sort them, and then compare to A's adjacency list. 
                    compare_list(jj,:) = [swapsi(adj_list_full(jj,1)) swapsi(adj_list_full(jj,2))];
                end
                
                compare_list = sortrows(compare_list);
                % now snip the indexes from the "full" adjacency list. 
                compare_list = compare_list(:,2);
                
                if(all(compare_list == adj_listA))
                    %fprintf('Woo, these graphs are isomorphic!\n');
                    output = 1;
                    return
                else
                    output = 0;
                end
            end
            
        else
            %fprintf('The graphs do not share the same loop lengths and cannot be isomorphic.\n');
            output = 0;
        end
        
    else
        %fprintf('The graphs do not share the same number of components and cannot be isomorphic.\n');
        output = 0;
    end

else
    %fprintf('These graphs are not the same size and cannot be isomorphic.\n');
    output = 0;
end

