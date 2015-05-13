function component = n_comps(A)
% N_COMPS calculates the number of components given an adjacency matrix A.
% It returns a list of the component each node belongs to.
% This is specifically for the setting of outdegree 1 in an arithmetic
% dynamics context.

% 28.4.2015
% Lukas WinklerPrins + Daniel Keliher
% Studio Applied Math

n = size(A,1);
adj_list = adjacency_list(A);

comp_index = 1;
component = zeros(n,1);

for ii = 1:n
    
    if(component(ii) == 0)
        %fprintf('ii = %d. Untouched node.\ncomp_index at %d.\n',ii,comp_index);
        
        loop = 1;
        comp_contents = []; % running list for component re-naming purposes. 
        jj = ii;
        
        while(loop)
            
            if(component(jj) == 0)
                %fprintf('jj = %d. Untouched child.\n',jj);
                comp_contents = [comp_contents jj];
                component(jj) = comp_index;
                jj = adj_list(jj);
                
            elseif(component(jj) == comp_index)
                %fprintf('jj = %d. Found part of same component.\n',jj);
                loop = 0;
                comp_index = comp_index + 1;
                
            else 
                %fprintf('jj = %d. Child is part of existing component, renaming with %d.\n',jj,component(jj));
                rewrite = component(jj);
                %fprintf('Ran into existing component %d.\n',rewrite);
                
                % now we need to fill component jj and children of jj
                % with "rewrite" value. 
                for kk = 1:length(comp_contents)
                    %fprintf('Rewriting node %d.\n',comp_contents(kk));
                    component(comp_contents(kk)) = rewrite;
                end
                
                % we found a closed loop. Keep this "new" index though.
                loop = 0;
                
            end
        end % while loop
    end
end

end