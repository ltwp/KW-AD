function output = eval_polynomial(coefs,x,p)
% EVAL_POLYNOMIAL will evaluate the polynomial defined by the coefficients
% in the row vector 'coefs' based on input 'x' and return output mod p. 
% Coefficients go from lowest degree to highest from left to right.

% OPTIONAL COEFFICIENT ORDER FLIP
%coefs = fliplr(coefs);

output = 0;
d = length(coefs) - 1;
for ii = 0:d
    output = output + coefs(ii+1)*(x^ii);
end

output = mod(output,p);

end