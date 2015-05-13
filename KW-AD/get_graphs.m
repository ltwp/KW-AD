function [matrices,coefs] = get_graphs(d,p)
% GET_GRAPHS(d,p) returns adjacency matrices all functions on a finite field
% mod p where d is the degree of the polynomials you want to evaluate. 
% Make sure p is prime. 

% Lukas WinklerPrins & Daniel Keliher
% 13 April 2015
% This function finds the graphs of polynomials of degree d in the finite
% field F_p where p is prime. 

if(~isprime(p))
    fprintf('Your second argument, p, is not prime! Please make it prime.\n');
    return
end

n_poly = p^(d+1); % to be overwritten later. 
n_coefs = d+1;

coefs = zeros(n_poly,n_coefs);

for ii = 1:n_coefs % columns
    
    incr = p^(ii-1); % 1, p, p^2, p^3, etc... changes each column
    
    for jj = 1:(n_poly/incr) % rows
        
        % values will go between 0 and p-1 (inclusive)
        
        % Fill in blocks of columns in the coefficients matrix, where each
        % block is the same value is the length of a power of p. 
        coefs(((jj-1)*incr + 1):(jj*incr),ii) = mod(jj-1,p);

    end
end

% Comment this line if you want to keep all polynomials of degree less than
% d as well. 
%coefs = coefs(((p^d)+1):end,:);

n_poly = size(coefs,1); % rewrite with new number of polynomials.

matrices = cell(n_poly,1);

% We can use the big coefficient matrix to generate a graph for each
% polynomial in the form of an adjacency matrix.

for ipoly = 1:n_poly
    % for each polynomial
    
    adj = zeros(p); % adjacency matrix
    
    for inode = 1:p        
        % Make adjacency matrix through edges, evaluated via polynomial. 
        
        poly_node_out = eval_polynomial(coefs(ipoly,:),inode-1,p)+1;
        % The plus one is for indexing purposes...
        
        adj(inode,poly_node_out) = 1;
        
    end
    
    matrices{ipoly} = adj;
    
end

end