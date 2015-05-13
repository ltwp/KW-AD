function list = adjacency_list(A)
% ADJACENCY_LIST makes an adjacency list (in matrix form) from an adjacency
% matrix. 

n = size(A,1);
list = zeros(n,1);

for ii = 1:n
    
    for jj = 1:n
        
        if(A(ii,jj))
            list(ii) = jj;
        end
        
    end
    
end

